class ChangeCommentTextToBeStringInComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :comment_text, :string
  end
end
