class Topic < ApplicationRecord
  belongs_to :user
  has_many :preferences, dependent: :destroy
  has_many :keywords, dependent: :destroy
  validates :name, presence: true
end
