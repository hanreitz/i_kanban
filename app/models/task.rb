class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category

  scope :category_tasks, ->(cat) { where(category: cat) }
  scope :count_tasks_by_user, ->(user) { where(user_id: user.id).count }
  scope :count_tasks_by_project, ->(project) { where(project_id: project.id).count }
  scope :next_five_tasks, ->(user) { where(user_id: user.id).where("due_date > ?", Date.today).order(:due_date).limit(5)}

  def change_category(data)
    category_array = ["Future", "Current", "Complete"]
    category_index = category_array.find_index("#{self.category}")
    forward_index = category_index + 1 unless category_index == category_array.length - 1
    backward_index = category_index - 1 unless category_index == 0
    if data == "+"
      self.update(category: category_array[forward_index])
    elsif data == "-"
      self.update(category: category_array[backward_index])
    end
  end
  # in the future, this method could take in data and a category_array
  # that way the user could set their own categories and the back and forward buttons
  # would still work
end