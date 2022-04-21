class AddProductNameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_name, :string
  end
end
