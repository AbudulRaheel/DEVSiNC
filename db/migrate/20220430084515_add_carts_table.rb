class AddCartsTable < ActiveRecord::Migration[5.2]
 
    def change
      create_table :carts do |t|
        t.references :user, null: false
        t.decimal :sub_total, default: 0
        t.timestamps
      end
    end
end
  
