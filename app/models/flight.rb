class Flight < ActiveRecord::Base
  attr_accessible :arrival_airport, :departs_at, :departure_airport, :miles, :number, :seats


  def arrives_at
    departs_at + duration.minutes
  end

  def duration
    miles / 8
  end

end
