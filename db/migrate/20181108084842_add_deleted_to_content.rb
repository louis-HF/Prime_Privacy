class AddDeletedToContent < ActiveRecord::Migration[5.2]
  def change
     add_column :contents, :deleted, :boolean
  end
end
