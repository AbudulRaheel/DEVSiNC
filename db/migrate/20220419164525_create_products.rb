# frozen_string_literal: true

# CreateProducts
class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :serial_no, null: false
      t.string :product_name, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
