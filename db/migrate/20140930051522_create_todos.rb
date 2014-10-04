class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :goal
      t.integer :team_member_id
      t.references :project, index: true

      t.timestamps
    end
  end
end
