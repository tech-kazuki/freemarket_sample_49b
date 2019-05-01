class RemoveForeignKeyBrandId < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :products, :brands
  end
end
