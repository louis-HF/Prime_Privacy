class AddColumnsToUserstatistique < ActiveRecord::Migration[5.2]
  def change
    add_column :userstatistiques, :total_fb_public, :integer
    add_column :userstatistiques, :total_fb_public_sensitive, :integer
    add_column :userstatistiques, :total_tw_public, :integer
    add_column :userstatistiques, :total_tw_public_sensitive, :integer
  end
end
