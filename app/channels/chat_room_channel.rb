# app/channels/chat_room_channel.rb
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    current_chat = ChatRoom.find(params[:id])
    stream_for current_chat, coder: ActiveSupport::JSON do |message|
      append_data = {}
      if message['sender_id'] == current_user.id
        append_data = { msg_class: 'message-right' }
      else
        append_data = { msg_class: 'message-left' }
      end
      transmit message.merge(append_data)
    end
  end
end
