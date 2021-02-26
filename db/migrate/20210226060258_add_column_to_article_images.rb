class AddColumnToArticleImages < ActiveRecord::Migration[6.0]
  def change
    add_column :article_images, :display_order, :integer
  end
end
