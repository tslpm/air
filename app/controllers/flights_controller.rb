class FlightsController < ApplicationController

  def index
    if params[:keyword].present?
      keyword = params[:keyword]
      airports = Airport.where('code LIKE ? OR city LIKE ?', "%#{keyword}%", "%#{keyword}%")

      @flights = Flight.where('departure_airport_id IN (?)', airports)

      # @flights = Flight.where("departure_airport LIKE ? or arrival_airport LIKE ?",
      #                           "%#{keyword}%",
      #                           "%#{keyword}%")
      @flights = @flights.order('number asc')
    else
      @flights = Flight.order('number asc')
    end

    @flights = @flights.paginate(:page => params[:page], :per_page => 5)

  end

end






