class User < ActiveRecord::Base
  attr_accessible :name, :password

  has_secure_password

end
