class AddContenuToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :text_publication, :text
    add_column :contents, :url_image, :string
  end
end
