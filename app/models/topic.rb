class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :preferences, dependent: :destroy
  has_many :keywords, dependent: :destroy
  has_many :topicstatistics
  validates :name, presence: true, uniqueness: {scope: :user}
end
