class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create]
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @car = Car.find(params[:car_id])
    if current_user.client.nil?
      @client = Client.create(user: current_user)
    else
      @client = current_user.client
    end
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.client = @client
    if @booking.save!
      redirect_to cars_path
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking = Booking.update(booking_status)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    redirect_to bookings_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_day, :end_day, :car_id, :client_id)
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
