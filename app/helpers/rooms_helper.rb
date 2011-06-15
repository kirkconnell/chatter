module RoomsHelper
  def room_connection_id_for(user)
    user.room_connections.where(:room_id => @room.id).last.id
  end
end
