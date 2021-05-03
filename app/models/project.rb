class Project < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks

  validates_presence_of :title, :description

  def owner_object
    User.find_by(id: self.owner)
  end

  def task_type(category)
    self.tasks.where(category: "#{category}")
  end

  scope :public_projects, -> { joins('INNER JOIN users ON projects.owner = users.id').where('users.public = true')}

end