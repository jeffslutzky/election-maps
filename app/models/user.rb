class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  validates_presence_of :name

end
