class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @car.delete
    redirect_to cars_path
  end

  private
  def car_params
    params.require(:car).permit(:model, :year, :brand, :category)
  end

end

