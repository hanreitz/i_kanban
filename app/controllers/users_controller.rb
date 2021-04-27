class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = helpers.current_user
  end

  private

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless session.include?(:user_id)
  end

end