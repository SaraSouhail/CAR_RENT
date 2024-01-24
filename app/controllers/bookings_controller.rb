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
      redirect_to booking_path(@booking)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking = Booking.update(booking_status)
    redirect_to booking_path(@booking) if @booking.save
  end

  def destroy
    @booking.destroy
    redirect_to car_path(@booking.car), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_day, :end_day, :car_id)
  end

  def booking_status
    params.require(:booking).permit(:status)
  end

  def set_booking
    @booking = booking.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
