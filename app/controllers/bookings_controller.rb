class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Bookmark.new(booking_params)
    @booking.car = @car
    Client.create(user: current_user) if current_user.client.blank?
    @booking.client = current_user.client

    if @booking.save
      redirect_to car_path(@car)
    end
  end

  def destroy
    @booking.destroy
    redirect_to car_path(@booking.car), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:sattus, :start_day, :end_day, :car_id)
  end

  def set_booking
    @booking = booking.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
