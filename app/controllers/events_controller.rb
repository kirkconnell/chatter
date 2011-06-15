class EventsController < ApplicationController
  before_filter :login_required, :load_room

  def index
    @messages = @room.messages.where("id > ?", params[:last_message].split('_').last)
    @users = @room.room_connections.where("id > ?", params[:last_connection]).map(&:user)
    @disconnects = @room.room_connections.where("disconnected = ?", true)
    render :nothing => true if @messages.blank? && @users.blank?
  end
end