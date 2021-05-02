class TasksController < ApplicationController
  def index
  end

  def new
  end

  def create
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
