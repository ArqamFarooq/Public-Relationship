class MsgsController < ApplicationController

  def index
  end

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @msg = @chat_room.msgs.new(params.require(:msg).permit(:body).merge(user_id: current_user.id))
    @msg.save
    redirect_to @chat_room
  end

  def new
  end

end
