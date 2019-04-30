class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.integer :price, null: false
      t.text :description
      t.references :category
      t.string :product_state
      t.string :burden
      t.string :size
      t.string :prefecture, null: false
      t.string :how_long
      t.string :how_ship
      t.references :brand
      t.string :availability
      t.references :user

      t.timestamps
    end
  end
end
