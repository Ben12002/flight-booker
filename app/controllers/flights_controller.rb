class FlightsController < ApplicationController

  def index
    if search_params
      @search_results = Flight.where(departure_airport_id: search_params[:departure_airport_id], 
                                     arrival_airport_id: search_params[:departure_airport_id], 
                                     departure_time: search_params[:departure_time]).to_a
    end
  end

  def search_params
    params.require(:search).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :passenger_amount)
  end
end
