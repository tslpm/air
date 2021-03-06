class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :email

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :reservations
  has_many :flights, through: :reservations

  has_secure_password

end
