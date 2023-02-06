class Post < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images
    mount_uploader :video, VideoUploader
    has_many :chat_room
end