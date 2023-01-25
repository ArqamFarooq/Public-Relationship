class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    byebug
    @chat = Chat.new(chat_params)
    
    if @chat.save
      redirect_to @chat
    else
      render 'new'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:room, user_ids: [])
  end
end
