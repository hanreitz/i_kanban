class ApplicationController < ActionController::Base
  include ApplicationHelper

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless session.include?(:user_id)
  end
end