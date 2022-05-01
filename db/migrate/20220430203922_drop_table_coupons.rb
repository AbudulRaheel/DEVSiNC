class DropTableCoupons < ActiveRecord::Migration[5.2]
  def change
    drop_table :coupons
  end
end
