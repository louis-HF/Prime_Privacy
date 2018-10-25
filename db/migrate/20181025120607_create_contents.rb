class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :external_provider
      t.text :external_id
      t.date :external_created_date
      t.date :external_edit_date
      t.date :external_deleted_date
      t.string :type
      t.boolean :selected
      t.integer :coef_total
      t.references :user, foreign_key: true
      t.date :scan_date

      t.timestamps
    end
  end
end
