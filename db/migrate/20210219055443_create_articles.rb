class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.integer :store_id
      t.text :body, null: false

      t.timestamps
    end
    add_reference :articles, :users, column: :author_id
  end
end
