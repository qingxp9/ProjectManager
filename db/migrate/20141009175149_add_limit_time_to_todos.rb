class AddLimitTimeToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :limit_time, :timestamp
  end
end
