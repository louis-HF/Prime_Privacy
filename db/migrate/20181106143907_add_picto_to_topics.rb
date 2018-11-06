class AddPictoToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :picto, :string
  end
end
