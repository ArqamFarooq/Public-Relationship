# app/channels/chat_room_channel.rb
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find(params[:id])
    stream_for chat_room
  end

  def receive(data)
    chat_room = ChatRoom.find(data['chat_room_id'])
    message = chat_room.msgs.create!(
      body: data['body'],
      user: current_user
    )
    ActionCable.server.broadcast("chat_room_#{chat_room.id}", message: render_message(message))
  end

  private

  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end
