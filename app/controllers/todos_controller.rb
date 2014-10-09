class TodosController < ApplicationController
  before_action :set_project

  def create
    @todo    = @project.todos.create(todo_params)
    redirect_to project_path(@project)
  end

  def edit
    @todo    = @project.todos.find(params[:id])
  end

  def edit_status
    @todo    = @project.todos.find(params[:id])
    @todo.status = !@todo.status
    @todo.save
    redirect_to project_todo_path(@project,@todo)
  end

  def change_limit_time
    @todo    = @project.todos.find(params[:id])
    @todo.update(limit_time_params)
    redirect_to project_todo_path(@project,@todo)
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

    def limit_time_params
      params.require(:todo).permit(:limit_time)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

end
