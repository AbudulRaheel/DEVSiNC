class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :string
      t.datetime :order_date
      t.string :user_id
      t.string :string
      t.string :payment_id
      t.string :string
      t.string :amount
      t.string :float

      t.timestamps
    end
  end
end
