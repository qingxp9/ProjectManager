class Model < ActiveRecord::Migration
  def change
    change_column :accesses, :rank, :integer, default: 1 
  end
end
