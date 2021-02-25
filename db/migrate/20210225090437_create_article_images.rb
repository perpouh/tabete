class CreateArticleImages < ActiveRecord::Migration[6.0]
  def change
    create_table :article_images do |t|
      t.integer :article_id
      t.text :image
      t.string :caption

      t.timestamps
    end
  end
end
