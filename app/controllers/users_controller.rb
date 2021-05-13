class UsersController < ApplicationController
  before_action :require_login, only: [:account, :edit, :update, :destroy]
  before_action :set_user, only: [:account, :edit, :update]

  def index
    @public_users = User.public_users
  end
  
  def new
    redirect_to user_path(current_user) unless !current_user
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if !@user.nil?
      @projects = @user.projects
      @next_five_tasks = Task.next_five_tasks(@user)
      redirect_to user_path(current_user), alert: "User not found." unless @user.public || @user == current_user
    else
      redirect_to root_path, alert: "User not found."
    end
  end

  def account
    @total_task_count = Task.count_tasks_by_user(@user)
    @complete_task_count = Task.category_tasks("Complete").count_tasks_by_user(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user), alert: "Account successfully updated."
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    user.delete
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :organization, :password, :password_confirmation, :public)
  end

  def set_user
    @user = current_user
  end

end