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

    if params[:page].nil?
      @page = 1
    else
      @page = params[:page].to_i
    end
    offset_number = (@page - 1) * 10
    @flights = @flights.offset(offset_number)
    @flights = @flights.limit(10)
    @num_pages = (Flight.count / 10.0).ceil
    @prev = @page - 1
    @next = @page + 1
  end

end






