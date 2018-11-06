class AddPublicationUrlToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :publication_url, :string
  end
end

