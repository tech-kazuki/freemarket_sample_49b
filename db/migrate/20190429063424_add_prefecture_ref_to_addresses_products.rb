class AddPrefectureRefToAddressesProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :prefecture, index: true
    add_reference :products, :prefecture, index: true
  end
end
