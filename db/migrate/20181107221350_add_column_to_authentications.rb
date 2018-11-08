class AddColumnToAuthentications < ActiveRecord::Migration[5.2]
  def change
    add_column :authentications, :tokensecret, :string
  end
end
