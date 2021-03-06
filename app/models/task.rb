class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category

  scope :category_tasks, ->(cat) { where(category: cat) }
  scope :count_tasks_by_user, ->(user) { where(user_id: user.id).count }
  scope :count_tasks_by_project, ->(project) { where(project_id: project.id).count }
  scope :next_five_tasks, ->(user) { where(user_id: user.id).where("due_date > ?", Date.today).where("category != ?", "Complete").order(:due_date).limit(5)}
  scope :order_by_due_date_and_priority, -> { order(:due_date).order(:priority) }
  scope :user_tasks, ->(user) { where(user_id: user.id)}
  scope :project_user_tasks, ->(project, user) { where(project_id: project.id).where(user_id: user.id) }

  PRIORITY = [
    ["High", 0],
    ["Medium", 1],
    ["Low", 2]
  ]

  def change_category(data)
    category_array = ["Future", "Current", "Complete"]
    category_index = category_array.find_index("#{self.category}")
    forward_index = category_index + 1 unless category_index == category_array.length - 1
    backward_index = category_index - 1 unless category_index == 0
    if data == "+"
      f = forward_index ||= category_array.length - 1
      self.update(category: category_array[f])
    elsif data == "-"
      b = backward_index ||= 0
      self.update(category: category_array[b])
    end
  end
  # in the future, this method could take in data and a category_array
  # that way the user could set their own categories and the back and forward buttons
  # would still work
end