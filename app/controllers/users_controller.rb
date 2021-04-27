class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless session.include?(:user_id)
  end
end