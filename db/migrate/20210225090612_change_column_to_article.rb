class ChangeColumnToArticle < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :body, :text, null: false
  end
end
