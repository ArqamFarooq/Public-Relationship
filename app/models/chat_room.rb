class ChatRoom < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :post
  has_many :msgs

  def other_user(current_user)
    users.where.not(id: current_user.id).first
  end
end
