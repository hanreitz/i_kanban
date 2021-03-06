class User < ApplicationRecord
  has_many :tasks
  has_many :projects, through: :tasks

  has_secure_password
  
  validates_presence_of :username, :email, :first_name, :last_name
  validates_uniqueness_of :username, :email
  validates_length_of :password, in: 6..40, on: :create, message: " must be 6-40 characters."
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Email address must be valid."

  scope :public_users, -> { where(public: true) }

  def owned_projects
    Project.where(owner: self.id)
  end

end