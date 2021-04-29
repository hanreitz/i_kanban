class Project < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks

  validates_presence_of :title, :description

  def self.public_projects
    self.all.select {|project| project.user.public == true }
  end
end