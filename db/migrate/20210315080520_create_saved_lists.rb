class CreateSavedLists < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_lists do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
