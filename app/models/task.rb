class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category

  scope :category_tasks, ->(cat) { where(category: cat) }
  scope :count_tasks_by_user, ->(user) { where(user_id: user.id).count }
  scope :count_tasks_by_project, ->(project) { where(project_id: project.id).count }

  def change_category(data)
    if data == "+"
      if self.category == "Future"
        self.update(category: "Current")
      elsif self.category == "Current"
        self.update(category: "Complete")
      elsif self.category == "Complete"
        self
      end
    elsif data == "-"
      if self.category == "Future"
        self
      elsif self.category == "Current"
        self.update(category: "Future")
      elsif self.category == "Complete"
        self.update(category: "Current")
      end
    end
  end
end