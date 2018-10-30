class CreateTopicstatistiques < ActiveRecord::Migration[5.2]
  def change
    create_table :topicstatistiques do |t|
      t.references :userstatistique, foreign_key: true
      t.references :topic, foreign_key: true
      t.integer :numberofinstances

      t.timestamps
    end
  end
end
