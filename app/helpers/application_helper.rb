module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def flash_alert?
    flash[:alert] ? flash[:alert] : ""
  end

  def categories
    ["Future", "Current", "Complete"]
  end

  def task_priority(task)
    Task::PRIORITY.find {|p| p[1] == task.priority}[0]
  end

end