# frozen_string_literal: true

# AddDescriptionToComment
class AddDescriptionToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :description, :string
    add_column :comments, :string, :string
  end
end
