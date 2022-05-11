# frozen_string_literal: true

# CreateCartProductsTable
class CreateCartProductsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.belongs_to :cart, null: false
      t.belongs_to :product, null: false
      t.integer :quantity, default: 1,null: false
      t.timestamps
    end
  end
end
