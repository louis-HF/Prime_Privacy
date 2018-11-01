class RemoveTokensFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :facebook_token
    remove_column :users, :twitter_token
  end
end
