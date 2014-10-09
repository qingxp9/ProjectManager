class AddProjectIdToTodos < ActiveRecord::Migration
  def change
    rename_column :todos, :team_member_id, :user_id
  end
end
