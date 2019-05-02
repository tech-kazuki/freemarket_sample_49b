class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :products, :users, column: "user_id"
    add_foreign_key :products, :categories, column: "category_id"
  end
end
