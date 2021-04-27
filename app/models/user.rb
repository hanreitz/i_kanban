class User < ApplicationRecord
  has_many :tasks
  has_many :projects, through: :tasks

  has_secure_password
  validates_presence_of :username, :email, :first_name, :last_name
  validates_uniqueness_of :username, :email
end