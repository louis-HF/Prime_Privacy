class Keyword < ApplicationRecord
  belongs_to :topic
  has_one :user, through: :topic
  has_many :content_keywords, dependent: :destroy
  validates :name, presence: true
end
