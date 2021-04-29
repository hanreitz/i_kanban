class ProjectsController < ApplicationController

  def index
    @projects = Project.public_projects
  end

  def new
    @project = Project.new
  end

  def show 
    @project = Project.find_by(id: params[:id])
  end
end
