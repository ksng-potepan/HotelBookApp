class RoomsController < ApplicationController
  def index
    @user = current_user
    @room = Room.where(['address LIKE ? ', "%#{params[:area]}%"]).where(['accommodation LIKE ? or guide LIKE ?', "%#{params[:search]}%","%#{params[:search]}%"])
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_path(@room)
    else
      render ('rooms/new')
    end

  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end

  def update
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room)
    else
      render ('rooms/edit')
    end
  end

  def myroom
    @user = current_user
    @room = Room.where(user_id: current_user.id)
  end

  private
  def room_params
    params.require(:room).permit(:accommodation, :guide, :charge, :address, :image)
  end
end
