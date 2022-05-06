# frozen_string_literal: true

#  RemoveProductIdFromCartItems
class RemoveProductIdFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :product_id, :string
  end
end
