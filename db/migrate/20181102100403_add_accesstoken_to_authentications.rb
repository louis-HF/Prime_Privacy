class AddAccesstokenToAuthentications < ActiveRecord::Migration[5.2]
  def change
    add_column :authentications, :accesstoken, :string
  end
end
