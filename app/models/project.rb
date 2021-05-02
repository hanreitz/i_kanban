class Project < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks

  validates_presence_of :title, :description

  def owner_object
    User.find_by(id: self.owner)
  end

  def future_tasks
    self.tasks.select {|t| t.category == "future"}
  end

  def self.public_projects
    self.all.select do |project|
      project.owner_object.public == true
    end
  end
end