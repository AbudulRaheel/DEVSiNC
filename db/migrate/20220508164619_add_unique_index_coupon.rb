# frozen_string_literal: true

# Add uniqe index
class AddUniqueIndexCoupon < ActiveRecord::Migration[5.2]
  def change
    add_index :coupons, :code, unique: true
  end
end
