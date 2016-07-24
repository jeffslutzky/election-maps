class Map < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :data

end
