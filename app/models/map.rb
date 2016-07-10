class Map < ActiveRecord::Base
  belongs_to :user

  def self.get_blue
    5
  end

  def self.get_red
    6
  end

end
