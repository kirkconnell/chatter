class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  helper_method :load_room

  protected
  def load_room
    @room = Room.find(params[:room_id])
  end
end
