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
      flash[:notice] = "We've sent you a confirmation email."
      
      @passengers = booking_params[:passengers_attributes] # equivalent to @passengers = params[:booking][:passengers_attributes]

      @passengers.each do |key, value|
        curr_passenger = Passenger.where(email: value[:email])[0]
        # curr_flight_id = params[:booking][:flight_id]
        curr_flight_id = booking_params[:flight_id]

        PassengerMailer.with(flight_id: curr_flight_id, 
                             passenger: curr_passenger).confirmation_email.deliver_now
      end
      
      
    else
      flash[:alert] = "Failed to book"
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
