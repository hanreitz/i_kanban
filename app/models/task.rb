class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category

  scope :category_tasks, ->(cat) { where(category: cat) }
  scope :tasks_by_user, ->(user) { where(user_id: user.id).count }
  scoep :tasks_by_project, ->(project) { where(project_id: project.id).count }
end