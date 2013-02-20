class Flight < ActiveRecord::Base
  attr_accessible :arrival_airport, :departs_at, :departure_airport, :miles, :number, :seats
end
