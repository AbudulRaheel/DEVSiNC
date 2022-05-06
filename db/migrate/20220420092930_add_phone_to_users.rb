# frozen_string_literal: true

# AddPhoneToUsers
class AddPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string

    add_column :users, :phone, :string
  end
end
