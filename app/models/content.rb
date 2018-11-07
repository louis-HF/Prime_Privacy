class Content < ApplicationRecord
  belongs_to :user
  has_many :content_keywords, dependent: :destroy

  mount_uploader :cloudinary_url, PhotoUploader
end
