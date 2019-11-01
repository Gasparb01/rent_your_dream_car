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
      redirect_to reservations_path
    else
      render :new
    end
  end

  def index
    @reservations = policy_scope(Reservation)
    @markers = @reservations.map do |reservation|
      {
        lat: reservation.car.latitude,
        lng: reservation.car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { reservation: reservation }),
        image_url: helpers.asset_url(reservation.car.photo)
      }
    end
  end

  def show
    @review = Review.new
    @markers = [{
      lat: @reservation.car.latitude,
      lng: @reservation.car.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { reservation: @reservation })
    }]
    authorize @reservation
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
    authorize @reservation
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
    params.require(:reservation).permit(:starting_date, :end_day, :price, :days)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end
end
