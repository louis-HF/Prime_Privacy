class Topic < ApplicationRecord
  belongs_to :user
  has_many :preferences
  has_many :keywords
end
