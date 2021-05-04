class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :advance_category, :back_category, :destroy]
  def index
    if params[:project_id]
      @tasks = Project.find_by(id: params[:project_id]).tasks
    else
      @tasks = Task.all
    end
  end

  def new
    @task = Task.new(project_id: params[:project_id], user_id: current_user.id)
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to project_path(@task.project)
    else
      render :new, alert: "Task could not be created."
    end
  end

  def show
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
    redirect_to project_tasks_path(project)
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :project_id, :due_date, :description, :priority, :category)
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end
end
