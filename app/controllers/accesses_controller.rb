class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  before_action :need_teamowner_rank
  def create
    @access = Access.new(access_params)
    if @access.save
      redirect_to current_user.team
    else
      render 'new'
    end
  end

  def new
    @access = Access.new
  end

  def edit
  end

  def update
    @access.update(access_params)
    respond_with(@access)
  end

  def destroy
    @access.destroy
    respond_with(@access)
  end

  private
    def set_access
      @access = Access.find(params[:id])
    end

    def access_params
      params.require(:access).permit(:user_id, :project_id, :rank)
    end

    def need_teamowner_rank
      redirect_to @team unless Access.find_by(user_id:current_user.id, rank:4)
    end
end
