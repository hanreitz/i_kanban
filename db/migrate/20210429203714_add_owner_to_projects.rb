class AddOwnerToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :owner, :integer
  end
end
