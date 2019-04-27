class AddColumnAddreses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :block_number, :string
  end
end
