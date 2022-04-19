class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_id
      t.string :produc_id
      t.datetime :date
      t.string :user_id

      t.timestamps
    end
  end
end
