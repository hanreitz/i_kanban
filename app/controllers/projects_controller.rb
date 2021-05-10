class ProjectsController < ApplicationController
  include ProjectsHelper

  before_action :set_project, only: [:show, :edit, :update, :my_tasks, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.public_projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, alert: "Project could not be created."
    end
  end

  def show 
    redirect_to user_path(current_user), alert: 'You do not have access to view this project.' unless @project.owner_object.public || @project.owner_object == current_user
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to project_path(@project), alert: "Project successfully updated."
    else
      render :edit
    end
  end

  def my_tasks
    @future_tasks = Task.project_user_tasks(@project, current_user).category_tasks("Future").order_by_due_date_and_priority
    @current_tasks = Task.project_user_tasks(@project, current_user).category_tasks("Current").order_by_due_date_and_priority
    @complete_tasks = Task.project_user_tasks(@project, current_user).category_tasks("Complete").order_by_due_date_and_priority
  end

  def destroy
    @project.tasks.each {|t| t.delete}
    @project.delete
    redirect_to user_path(current_user), alert: "Project deleted."
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :organization, :owner)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end
end
