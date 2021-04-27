class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :due_date, :description, :category
end