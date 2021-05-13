class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :advance_category, :back_category, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :advance_category, :back_category, :destroy]
  
  def index
    @tasks = Project.public_projects.collect {|p| p.tasks }.flatten
  end

  def new
    @task = Task.new(project_id: params[:project_id], user_id: current_user.id)
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to project_path(@task.project)
    else
      render :new
    end
  end

  def show
    redirect_to user_path(current_user), alert: 'You do not have access to view this task.' unless @task.project.owner_object.public 
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.valid?
      redirect_to project_path(@task.project), alert: "Task successfully updated."
    else
      render :edit
    end
  end

  def advance_category
    @task.change_category("+")
    redirect_to project_path(@task.project)
  end

  def back_category
    @task.change_category("-")
    redirect_to project_path(@task.project)
  end

  def destroy
    project = @task.project
    @task.delete
    redirect_to project_path(project)
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :project_id, :due_date, :description, :priority, :category)
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end
end
