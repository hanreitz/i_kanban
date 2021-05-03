class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category

  scope :completed_tasks, ->(user) { where(user_id: user.id).where(category: "Complete").count }
end