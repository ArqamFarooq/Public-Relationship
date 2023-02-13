# app/channels/chat_room_channel.rb
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room:#{params[:id]}"
  end

  def receive(data)
    chat_room = ChatRoom.find(data['chat_room_id'])
    msg = chat_room.msgs.create!(
      body: data['body'],
      user: current_user
    )
    ActionCable.server.broadcast("chat_room:#{data['chat_room_id']}", msg: render_message(msg))
  end

  private

  def render_message(msg)
    ApplicationController.render(
      partial: 'msgs/msg',
      locals: { msg: msg }
    )
  end
end
