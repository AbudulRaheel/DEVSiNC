# frozen_string_literal: true

# CreateTablecoupons
class CreateTable < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :code, unique: true,null: false
      t.decimal :discount, null: false
      t.date :expiry_date, null: false
      t.timestamps
    end
  end
end
