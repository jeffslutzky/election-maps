class User < ActiveRecord::Base
  has_many :maps
  has_secure_password
  validates_presence_of :name


end
