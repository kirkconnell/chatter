class MessagesController < ApplicationController
  before_filter :validate_ajax, :load_room, :login_required
  
  def create
    @message = @room.messages.create(params[:message].merge(:user_id => current_user.id))
  end

  protected
  def validate_ajax
    render :nothing => true unless request.xhr?
  end
end
