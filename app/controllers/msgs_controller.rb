class MsgsController < ApplicationController

  def index
  end

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @msg = @chat_room.msgs.new(msg_params)
    @msg.save
    ChatRoomChannel.broadcast_to(@chat_room, { msg: render(partial: 'msgs/msg', locals: { msg: @msg }), sender_id: current_user.id, msg_id: @msg.id }) and return
  end

  def new
  end

  private

  def msg_params
    params.require(:msg).permit(:user_id, :body)
  end
end
