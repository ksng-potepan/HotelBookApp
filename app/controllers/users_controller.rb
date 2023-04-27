class UsersController < ApplicationController
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(username: params[:username], introduce: params[:introduce])
    if @user.save
      flash[:notice] = "更新しました"
      redirect_to action: "profile"
    else
      flash.now[:alert] = "更新できませんでした"
      render('users/edit')
    end
  end
end
