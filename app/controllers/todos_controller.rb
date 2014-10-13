class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :need_basic_rank, only: :show
  before_action :need_pjadmin_rank, only: [:create, :destroy]
  before_action :edit_right, only: [:edit, :update, :change_limit_time]
  before_action :edit_status, only: :edit_status


  def create
    @todo    = @project.todos.create(todo_params)
    created_todo_name = @todo.goal

    Event.create(user_id:current_user.id, action:"创建了", 
                todo_id:@todo.id, content:created_todo_name)

    redirect_to project_path(@project)
  end

  def edit
    @todo    = @project.todos.find(params[:id])
  end

  def edit_status
    @todo    = @project.todos.find(params[:id])
    @todo.status = !@todo.status
    @todo.save

    Event.create(user_id:current_user.id, action:"完成了", 
                todo_id:@todo.id)

    redirect_to project_todo_path(@project,@todo)
  end

  def change_limit_time
    @todo    = @project.todos.find(params[:id])
    old_limit_time = @todo.limit_time
    @todo.update(limit_time_params)
    change_content = "将任务完成时间从 #{old_limit_time} 
                  修改为 #{@todo.limit_time} "

    Event.create(user_id:current_user.id, action:"修改了", 
                todo_id:@todo.id, content:change_content)

    redirect_to project_todo_path(@project,@todo)
  end

  def show
    @todo    = @project.todos.find(params[:id])
  end

  def update
    @todo = @project.todos.find(params[:id])
    old_todo_user_email = @todo.user ? @todo.user.email : "未指派" 

    if @todo.update(todo_params)

      #change user
      if @todo.user
        if @todo.user.email != old_todo_user_email
          change_content = "将任务完成者由#{old_todo_user_email}修改为#{@todo.user.email}"
          Event.create(user_id:current_user.id, action:"修改了", 
                      todo_id:@todo.id, content:change_content)
        end
      end

      redirect_to project_todo_path(@project,@todo)
    else
      render 'edit'
    end
  end

  def destroy
    @todo = @project.todos.find(params[:id])
    deleted_todo_name = @todo.goal
    @todo.destroy

    Event.create(user_id:current_user.id, action:"删除了", 
                content:deleted_todo_name)

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
      @team = @project.team
    end

    def edit_right
      @todo = @project.todos.find(params[:id])
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:3) or Access.find_by(user_id:current_user.id, rank:4)
    end

    def edit_status_right
      @todo = @project.todos.find(params[:id])
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:3) or Access.find_by(user_id:current_user.id, rank:4) or @todo.user == current_user
    end

    def need_basic_rank
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:[2,3]) or Access.find_by(user_id:current_user.id, rank:4)
    end

    def need_pjadmin_rank
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:3) or Access.find_by(user_id:current_user.id, rank:4)
    end

end
