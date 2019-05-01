class Products < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :brand_id
  end
end
