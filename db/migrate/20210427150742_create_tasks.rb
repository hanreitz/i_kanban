class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :project_id
      t.date :due_date
      t.string :description
      t.string :priority
      t.string :category

      t.timestamps
    end
  end
end
