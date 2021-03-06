class CarsController < ApplicationController
  skip_after_action :verify_authorized, only: :search
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = policy_scope(Car).where(owner: current_user)
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = current_user.cars.new(car_params)
    authorize @car
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def search
    @cars = policy_scope(Car).where(category: params["search"]["query"])

    @cars = Car.geocoded

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car })
      }
    end
  end

  private

  def car_params
    params.require(:car).permit(:model, :year, :brand, :category, :description, :location, :photo, :price)
  end

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end
end
