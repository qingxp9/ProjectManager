class TodosController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @todo    = @project.todos.create(todo_params)
    redirect_to project_todo_path(@project,@todo)
  end

  def index
  end

  def new
  end

  def edit
    @project = Project.find(params[:project_id])
    @todo    = @project.todos.find(params[:id])
  end

  def show
    @project = Project.find(params[:project_id])
    @todo    = @project.todos.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @todo = @project.todos.find(params[:id])

    if @todo.update(todo_params)
      redirect_to project_todo_path(@project,@todo)
    else
      render 'edit'
    end
  end


  def destroy
    @project = Project.find(params[:project_id])
    @todo    = @project.todos.find(params[:id])
    @todo.destroy
    redirect_to project_path(@project)
  end

  private
    def todo_params
      params.require(:todo).permit(:goal, :team_member_id)
    end
end
