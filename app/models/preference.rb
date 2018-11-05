class Preference < ApplicationRecord
  include RailsSortable::Model
  belongs_to :user
  belongs_to :topic
  set_sortable :rank
end
