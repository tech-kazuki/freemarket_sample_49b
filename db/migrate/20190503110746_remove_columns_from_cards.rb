class RemoveColumnsFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :number, :string
    remove_column :cards, :valid_month, :string
    remove_column :cards, :valid_year, :string
    remove_column :cards, :security_number, :string
  end
end
