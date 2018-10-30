class Userstatistique < ApplicationRecord
  belongs_to :user
  has_many :topicstatistiques
end
