class ContentKeyword < ApplicationRecord
  belongs_to :content
  belongs_to :keyword
end
