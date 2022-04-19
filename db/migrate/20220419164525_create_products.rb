class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :serial_no
      t.string :descriptio
      t.string :price
      t.string :float
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
