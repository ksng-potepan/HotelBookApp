class ReservationsController < ApplicationController
    def confirm
        @user = current_user
        @reservation = Reservation.new(reservation_params)
        @room = Room.find(reservation_params[:room_id])
        render 'rooms/show' if @reservation.invalid?
    end

    def create
        @user = current_user
        @reservation = Reservation.new(reservation_params)
        @room = Room.find(reservation_params[:room_id])
        if params[:back] || !@reservation.save
            render 'rooms/show'
        else
            redirect_to reservations_path(@reservation)
        end
    end

    def index
        @user = current_user
        @reservation = Reservation.all.where(user_id: current_user.id)
    end

    private
    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :guest, :payment, :room_id).merge(user_id: current_user.id)
    end
end
