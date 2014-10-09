class RemoveUserIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user_id
    rename_column :comments, :commenter, :user_id
  end
end
