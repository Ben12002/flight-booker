class PassengerMailer < ApplicationMailer
  default from: "bendamian2012@gmail.com"
  
  def confirmation_email
    @passenger = params[:passenger]
    @flight = Flight.find(params[:flight_id])
    mail(to: @passenger.email, subject: 'Flight Booking')
  end
end


