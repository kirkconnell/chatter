class AddDisconnectedToRoomConnection < ActiveRecord::Migration
  def change
    add_column :room_connections, :disconnected, :boolean
  end
end
