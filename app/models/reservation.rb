class Reservation < ActiveRecord::Base
  attr_accessible :credit_card, :departs_on, :flight_id, :user_id

  belongs_to :flight
  belongs_to :user

  after_create :increase_user_miles

  validate :credit_card_is_a_visa

  def credit_card_is_a_visa
    unless credit_card.starts_with?("4") && self.credit_card.length == 16
      errors.add(:credit_card, "must be a Visa card")
    end
  end

  # def user
  #   # memoization
  #   @user ||= User.find_by_id(self.user_id)

  #   # @user = @user || User.find_by_id(self.user_id)

  #   # if @user.nil?
  #   #   @user = User.find_by_id(self.user_id)
  #   # end
  #   # return @user
  # end

  def increase_user_miles
    self.user.miles += self.flight.miles
    self.user.save
  end

end



