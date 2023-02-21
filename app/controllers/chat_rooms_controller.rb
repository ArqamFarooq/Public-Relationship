class ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ChatRoom.where.not(user_one_id: nil, user_two_id: nil).where("user_one_id = ? OR user_two_id = ?", current_user.id, current_user.id)
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.msgs
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    chats = ChatRoom.all
    @chat_room = chats.where(user_one_id: current_user.id, user_two_id: params[:user_two_id]).or(chats.where(user_one_id: params[:user_two_id], user_two_id: current_user.id)).first
    redirect_to @chat_room and return if @chat_room
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.user_one_id = current_user.id
    @chat_room.user_two_id = params[:user_two_id]
    if @chat_room.save
      redirect_to @chat_room
    else
      render :new
    end
  end

  def send_message
    @chat_room = ChatRoom.find(params[:id])
    message = Msg.create(chat_room_id: params[:id], body: params[:message])
    ActionCable.server.broadcast("chat_room_#{params[:id]}", message: message.body)
    head :no_content
  end

  private
  
  def chat_room_params
    # params.require(:chat_room).permit(:user_two_id)
  end
end