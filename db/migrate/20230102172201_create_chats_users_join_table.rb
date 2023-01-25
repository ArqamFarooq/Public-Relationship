class CreateChatsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chats, :users do |t|
      t.index :chat_id
      t.index :user_id
    end
  end
end
