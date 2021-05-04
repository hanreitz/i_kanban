module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def flash_alert?
    flash[:alert] ? flash[:alert] : ""
  end
end