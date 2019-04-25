class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :number, null: false
      t.string :valid_month, null: false
      t.string :valid_year, null: false
      t.string :security_number, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
