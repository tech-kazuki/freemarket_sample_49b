class RemovePrefectureFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :prefecture, :string
  end
end
