class Userstatistic < ApplicationRecord
  belongs_to :user
  has_many :topicstatistics, dependent: :destroy
end
