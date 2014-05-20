class AddDueDateUserIdToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :due_date, :date
  	add_column :tasks, :user_id, :integer
  end
end
