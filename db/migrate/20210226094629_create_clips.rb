class CreateClips < ActiveRecord::Migration[6.0]
  def change
    create_table :clips do |t|
      t.integer :list_id
      t.integer :store_id

      t.timestamps
    end
  end
end
