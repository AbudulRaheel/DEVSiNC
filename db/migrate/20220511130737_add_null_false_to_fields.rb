class AddNullFalseToFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :uuid, false
    change_column_null :carts, :sub_total, false
    change_column_null :cart_products, :quantity, false
    change_column_null :orders, :total, false
    change_column_null :coupons, :code, false
  end
end
