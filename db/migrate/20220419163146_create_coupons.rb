# frozen_string_literal: true

#  CreateCoupons
class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :coupon_id

      t.string :string
      t.string :coupon_name

      t.string :string
      t.string :discount_percentage
      t.float :float
      t.string :valid_till
      t.string :date
      t.string :date

      t.timestamps
    end
  end
end
