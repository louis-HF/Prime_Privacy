class CreateUserstatistiques < ActiveRecord::Migration[5.2]
  def change
    create_table :userstatistiques do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.integer :fb_photo_public
      t.integer :fb_photo_public_sensitive
      t.integer :fb_post_public
      t.integer :fb_post_public_sensitive
      t.integer :fb_likes_public
      t.integer :fb_likes_public_sensitive
      t.integer :tw_photo_public
      t.integer :tw_photo_public_sensitive
      t.integer :tw_post_public
      t.integer :tw_post_public_sensitive
      t.integer :tw_likes_public
      t.integer :tw_likes_public_sensitive

      t.timestamps
    end
  end
end
