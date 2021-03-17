class CreateArticleImages < ActiveRecord::Migration[6.0]
  def change
    create_table :article_images do |t|
      t.integer :article_id
      t.text :image_data
      t.string :caption
      t.integer :display_order

      t.timestamps
    end
    add_reference :article_images, :articles, column: :article_id
  end
end
