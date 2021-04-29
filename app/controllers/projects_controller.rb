class ProjectsController < ApplicationController

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
    @project = Project.find_by(id: params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :organization, :owner)
  end
end
