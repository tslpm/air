class Flight < ActiveRecord::Base
  attr_accessible :arrival_airport, :departs_at, :departure_airport, :miles, :number, :seats

  before_create :calculates_miles

  MILEAGE_CHART = [
            ['ORD', 'JFK', 740],
            ['ORD', 'LAX', 1744],
            ['ORD', 'SFO', 1846],
            ['JFK', 'LAX', 2475],
            ['JFK', 'SFO', 2586],
            ['LAX', 'SFO', 338]
          ]

  def calculates_miles
    e = MILEAGE_CHART.detect do |entry|
      (entry.first == self.departure_airport &&
            entry.second == self.arrival_airport) ||
      (entry.second == self.departure_airport &&
            entry.first == self.arrival_airport)
    end
    self.miles = e.third
  end

  def arrives_at
    departs_at + duration.minutes
  end

  def duration
    miles / 8
  end

end
