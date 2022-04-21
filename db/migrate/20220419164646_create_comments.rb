class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_id
      t.datetime :date

      t.references :user, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.timestamps
    end
  end
end
