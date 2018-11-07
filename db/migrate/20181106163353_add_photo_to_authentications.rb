class AddPhotoToAuthentications < ActiveRecord::Migration[5.2]
  def change
    add_column :authentications, :photo, :string
  end
end
