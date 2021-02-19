class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :body

      t.timestamps
    end
  end
end
