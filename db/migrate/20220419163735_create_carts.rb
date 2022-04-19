class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :cart_id
      t.string :item_count
      t.string :integer
      t.string :total_bill
      t.string :float
      t.string :order_id
      t.string :string

      t.timestamps
    end
  end
end
