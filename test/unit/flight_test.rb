require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  test "a flight calculates its own miles" do
    f = Flight.new
    f.departure_airport = 'ORD'
    f.arrival_airport = 'JFK'
    f.save

    assert_equal 740, f.miles
  end

  test "a flight from LAX to SFO" do
    f = Flight.new
    f.departure_airport = "LAX"
    f.arrival_airport = "SFO"
    f.save

    assert_equal 338, f.miles
  end
  test "a flight from LAX to ORD" do
    f = Flight.new
    f.departure_airport = "LAX"
    f.arrival_airport = "ORD"
    f.save

    assert_equal 1744, f.miles
  end
end
