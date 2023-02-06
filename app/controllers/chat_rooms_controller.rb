class ChatRoomsController < ApplicationController

  def index
    byebug
    @chat_rooms = current_user.chat_rooms
  end
  def show
    @post = Post.find(params[:post_id])
    @chat_room = ChatRoom.find_by(post_id: @post.id)
    @messages = @chat_room.msgs
  end
  def send_message
    @chat_room = ChatRoom.find(params[:id])
    message = Msg.create(chat_room_id: params[:id], body: params[:message])
    ActionCable.server.broadcast("chat_room_#{params[:id]}", message: message.body)
    head :no_content
  end
end