# frozen_string_literal: true

# RemoveFieldsFromCartsItem
class RemoveFieldsFromCartsItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :price, :float
  end
end
