class AddPrefIdToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :prefecture_id, :integer, after: :name
  end
end
