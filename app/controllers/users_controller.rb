class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

  def require_login
    redirect_to login_path unless session.include?(:user_id)
  end
end