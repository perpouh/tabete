class CreateStoreImages < ActiveRecord::Migration[6.0]
  def change
    create_table :store_images do |t|
      t.integer :store_id
      t.text :image
      t.stiring :caption
      t.integer :display_order

      t.timestamps
    end
  end
end
