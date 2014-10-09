class ProjectsController < ApplicationController
  before_action :set_projects

  def create
    @project = @projects.build(project_params) if user_signed_in?
    
    if @project.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def index
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to @team
  end

  private
    def project_params
      params.require(:project).permit(:title, :describe, :team_id)
    end

    def set_projects
      @team = current_user.team
      @projects = @team.projects
    end

end
