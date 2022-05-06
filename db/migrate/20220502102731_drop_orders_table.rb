# frozen_string_literal: true

# DropOrdersTable
class DropOrdersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :orders
    drop_table :order_details
  end
end
