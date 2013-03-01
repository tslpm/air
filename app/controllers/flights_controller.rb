class FlightsController < ApplicationController

  def index
    if params[:keyword].present?
      keyword = params[:keyword]
      @flights = Flight.where("departure_airport LIKE ? or arrival_airport LIKE ?",
                                "%#{keyword}%",
                                "%#{keyword}%")
      @flights = @flights.order('number asc')
    else
      @flights = Flight.order('number asc')
    end
    @flights = @flights.limit(500)

    if params[:page].present?
      offset_number = (params[:page].to_i - 1) * 10
      @flights = @flights.offset(offset_number)
    end

    @flights = @flights.limit(10)

    @num_pages = (Flight.count / 10.0).ceil

  end

end






