class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :action
      t.integer :todo_id
      t.string :content

      t.timestamps
    end
  end
end
