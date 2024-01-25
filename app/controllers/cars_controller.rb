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
    @car = car.new(car_params)
    Owener.create(user: current_user) if current_user.owener.blank?
    @car.owener = current_user.owener
    @car.save
  end

  def update
    @car.update(car_params)
  end

  def edit
    @car = Car.find(params[:id])
  end

  def destroy
    @car.destroy
    redirect_to car_path(@car.all), status: :see_other
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :price)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
