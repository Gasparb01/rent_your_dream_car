class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.car = Car.find(params[:car_id])
    authorize @reservation

    if @reservation.save
      redirect_to reservations_index_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def destroy
    @reservation.destroy
    redirect_to cars_path
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :starting_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end
end
