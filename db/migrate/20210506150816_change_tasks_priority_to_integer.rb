class ChangeTasksPriorityToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :priority, :integer
  end
end
