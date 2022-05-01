class AddCouponToCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :coupon, foreign_key: true
  end
end
