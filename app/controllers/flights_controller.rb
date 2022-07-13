class FlightsController < ApplicationController

  def index
    @render_result = !(params[:search].nil?)

    if @render_result
      @search_results = Flight.where(departure_airport_id: search_params[:departure_airport_id], 
                                     arrival_airport_id: search_params[:arrival_airport_id], 
                                     departure_time: search_params[:departure_time])
      @passenger_amount = search_params[:passenger_amount]
    end
  end

  def search_params
    params.require(:search).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :passenger_amount)
  end
end
