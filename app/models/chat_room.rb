class ChatRoom < ApplicationRecord
  has_many :msgs, dependent: :destroy

  def other_user(current_user)
    users.where.not(id: current_user.id).first
  end

  def other_users(current_user_id)
    if user_one_id != user_two_id
      User.where(id: [user_one_id, user_two_id]).where.not(id: current_user_id)
    else
      User.where(id: current_user_id)
    end
  end
end
