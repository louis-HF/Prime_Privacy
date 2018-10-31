class CreateTopicstatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :topicstatistics do |t|
      t.references :userstatistic, foreign_key: true
      t.references :topic, foreign_key: true
      t.integer :numberofinstances

      t.timestamps
    end
  end
end
