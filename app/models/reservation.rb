class Reservation < ActiveRecord::Base
  attr_accessible :credit_card, :departs_on, :flight_id, :user_id

  belongs_to :flight
  belongs_to :user

end
