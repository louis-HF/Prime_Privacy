class AddDescriptionToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :description, :string
  end
end
