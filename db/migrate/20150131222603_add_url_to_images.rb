class AddUrlToImages < ActiveRecord::Migration
  def change
    add_column :images, :url, :string
    add_column :images, :image_blob, :text
    rename_column :images, :title, :name
    add_index :images, :url, unique: true
  end
end
