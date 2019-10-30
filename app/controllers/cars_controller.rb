class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = policy_scope(Car)
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

  private

  def car_params
    params.require(:car).permit(:model, :year, :brand, :category, :description, :location, :photo)
  end

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end
end
