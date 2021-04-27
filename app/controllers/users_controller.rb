class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
  end

  def create
  end
  
  def show
    @user = helpers.current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :organization, :password, :public)
  end

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless session.include?(:user_id)
  end

end