class CreateContentKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :content_keywords do |t|
      t.references :content, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
