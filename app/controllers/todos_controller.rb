class TodosController < ApplicationController
  before_action :set_project

  def create
    @todo    = @project.todos.create(todo_params)
    redirect_to project_path(@project)
  end

  def index
  end

  def new
  end

  def edit
    @todo    = @project.todos.find(params[:id])
  end

  def show
    @todo    = @project.todos.find(params[:id])
  end

  def update
    @todo = @project.todos.find(params[:id])

    if @todo.update(todo_params)
      redirect_to project_todo_path(@project,@todo)
    else
      render 'edit'
    end
  end

  def destroy
    @todo    = @project.todos.find(params[:id])
    @todo.destroy
    redirect_to project_path(@project)
  end

  private
    def todo_params
      params.require(:todo).permit(:goal, :user_id)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

end
