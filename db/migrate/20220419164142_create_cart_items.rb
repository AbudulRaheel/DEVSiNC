class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :carts, null: false, foreign_key: true
      t.string :product_id
      t.string :price
      t.string :float
      t.string :quantity
      t.string :integer

      t.timestamps
    end
  end
end
