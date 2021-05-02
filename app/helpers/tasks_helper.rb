module TasksHelper
  def project_id_field(task)
    if task.project.nil?
      select_tag "task[project_id]", options_from_collection_for_select(Project.all, :id, :title), { prompt: 'Select Project' }
    else
      hidden_field_tag "task[project_id]", task.project.id
    end
  end
end
