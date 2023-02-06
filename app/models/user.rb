class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  
  mount_uploader :profile_image, ImageUploader
  has_and_belongs_to_many :chats
  has_many :messages, through: :chats
  has_many :posts
  has_many :msgs
  has_and_belongs_to_many :chat_rooms
end
