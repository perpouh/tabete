class ChangeColumnToImages < ActiveRecord::Migration[6.0]
  def change
    rename_column :article_images, :image, :image_data
    rename_column :store_images, :image, :image_data
  end
end
