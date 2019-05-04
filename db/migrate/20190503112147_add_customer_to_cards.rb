class AddCustomerToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :customer, :string
  end
end
