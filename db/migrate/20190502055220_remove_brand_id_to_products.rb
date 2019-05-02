class RemoveBrandIdToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :brand_id, :references
  end
end
