class ChangeTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :type, :file_type
  end
end
