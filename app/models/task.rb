class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category

  scope :category_tasks, ->(cat) { where(category: cat) }
  scope :count_tasks_by_user, ->(user) { where(user_id: user.id).count }
  scope :count_tasks_by_project, ->(project) { where(project_id: project.id).count }

  def change_category(data)
    category_array = ["Future", "Current", "Complete"]
    category_index = category_array.find_index("#{self.category}")
    forward_index = category_index + 1 unless category_index == 2
    backward_index = category_index - 1 unless category_index == 0
    if data == "+"
      self.update(category: category_array[forward_index])
    elsif data == "-"
      self.update(category: category_array[backward_index])
    end
  end
end