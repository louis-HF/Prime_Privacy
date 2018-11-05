class ContentKeyword < ApplicationRecord
  belongs_to :content
  belongs_to :keyword
  has_one :user, through: :content
end
