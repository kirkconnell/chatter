class Room < ActiveRecord::Base
  has_many :messages
  has_many :room_connections
  has_many :users, :through => :room_connections
end
