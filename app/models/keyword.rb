class Keyword < ApplicationRecord
  belongs_to :topic
  has_many :content_keywords
end
