class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = current_user
  end

  private

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless session.include?(:user_id)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end