class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :prefecture_id
      t.string :address
      t.string :place
      t.string :nearest_station
      t.string :phone_number

      t.timestamps
    end
  end
end
