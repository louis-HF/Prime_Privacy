class Topic < ApplicationRecord
  belongs_to :user
  has_many :preferences, dependent: :destroy
  has_many :keywords, dependent: :destroy
  has_many :topicstatistiques
  validates :name, presence: true
end
