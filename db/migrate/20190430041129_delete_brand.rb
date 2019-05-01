class DeleteBrand < ActiveRecord::Migration[5.2]
  def changes
   drop_table :brands
  end
end
