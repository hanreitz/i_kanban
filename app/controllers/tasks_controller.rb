class TasksController < ApplicationController
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
      redirect_to project_tasks_path(@task.project)
    else
      render :new, alert: "Task could not be created."
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :project_id, :due_date, :description, :priority, :category)
  end
end
