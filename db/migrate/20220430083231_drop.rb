class Drop < ActiveRecord::Migration[5.2]
  def change
    drop_table :cart_items
    drop_table :carts 
  end
end
