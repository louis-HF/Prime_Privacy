class AddCloudinaryUrlToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :cloudinary_url, :string
  end
end
