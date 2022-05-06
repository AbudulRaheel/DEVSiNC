# frozen_string_literal: true

# ChangeDataTypeForProductQuantity
class ChangeDataTypeForProductQuantity < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :quantity, :string
    add_column :products, :quantity, :integer
  end
end
