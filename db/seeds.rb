# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Flight.destroy_all

airports = [
            ['ORD', 'JFK', 740],
            ['ORD', 'LAX', 1744],
            ['ORD', 'SFO', 1846],
            ['JFK', 'LAX', 2475],
            ['JFK', 'SFO', 2586],
            ['LAX', 'SFO', 338]
          ]

100.times do
  airport = airports.sample
  randomizer = [0,1].shuffle
  f = Flight.new
  f.number = rand(100..999)
  f.departure_airport = airport[randomizer[0]]
  f.arrival_airport = airport[randomizer[1]]
  f.miles = airport[2]
  f.departs_at = Time.now.beginning_of_day + rand(24.hours)
  f.seats = 60
  f.save
end

puts "Created 100 flights"




