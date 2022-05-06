# frozen_string_literal: true

# RemoveFieldsFromCarts
class RemoveFieldsFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :cart_id, :string
  end
end
