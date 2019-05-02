class RemoveColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :brand, :string
    remove_column :products, :a, :string
  end
end
