# frozen_string_literal: true

# CreateOrdersTable
class CreateOrdersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.references :user, foreign_key: true
      t.references :coupon, foreign_key: true
      t.timestamps
    end
  end
end
