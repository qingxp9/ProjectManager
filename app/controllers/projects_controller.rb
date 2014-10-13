class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team
  before_action :need_basic_rank, only: :show
  before_action :need_pjadmin_rank, only: [:edit, :update]
  before_action :need_teamowner_rank, only: [:new, :create, :destroy]

  def create
    @project = Project.new(project_params)
    @project.team_id = @team.id
    
    if @project.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def show
  end

  def update
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

    def set_team
      @team = current_user.team
    end

    def need_basic_rank
      @project = Project.find(params[:id])
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:[2,3]) or Access.find_by(user_id:current_user.id, rank:4)
    end

    def need_pjadmin_rank
      @project = Project.find(params[:id])
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:3) or Access.find_by(user_id:current_user.id, rank:4)
    end

    def need_teamowner_rank
      redirect_to @team unless Access.find_by(user_id:current_user.id, rank:4)
    end

end
