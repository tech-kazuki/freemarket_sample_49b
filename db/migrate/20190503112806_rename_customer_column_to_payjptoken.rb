class RenameCustomerColumnToPayjptoken < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :customer, :payjptoken
  end
end
