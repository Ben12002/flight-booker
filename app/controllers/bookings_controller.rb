class BookingsController < ApplicationController

  def new
    @passenger_amount = params[:passenger_amount].to_i
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new()
    @passenger_amount.times {@booking.passengers.build}
  end

  def create

    # No need to manually create passengers here because of "accepts_nested_attributes_for :passengers"
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # Strong params?
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_amount, passengers_attributes: [:name, :email])
  end
end
