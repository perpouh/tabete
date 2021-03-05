class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :creator_id
      t.string :title
      t.boolean :visible
      t.timestamps
    end
  end
end
