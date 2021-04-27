class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      render :new, alert: "User could not be created."
    end
  end

  def show
    @user = current_user
    @projects = @user.projects
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :organization, :password, :password_confirmation, :public)
  end

  def require_login
    redirect_to login_path, alert: "You must be logged in to view this page." unless session.include?(:user_id)
  end

end