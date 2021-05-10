module ProjectsHelper
  def contributor(project, user)
    project.tasks.collect {|t| t.user_id}.include?(user.id)
  end
end