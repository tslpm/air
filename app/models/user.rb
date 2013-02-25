class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :reservations

  has_secure_password

end
