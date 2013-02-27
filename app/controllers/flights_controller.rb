class FlightsController < ApplicationController

  def index
    if params[:keyword].present?
      keyword = params[:keyword]
      # @flights = Flight.where(departure_airport: params[:keyword], arrival_airport: params[:keyword])
      @flights = Flight.where("departure_airport = ? or arrival_airport = ?", keyword, keyword)
      @flights = @flights.order('number asc')
    else
      @flights = Flight.order('number asc')
    end
    @flights = @flights.limit(500)
  end

end
