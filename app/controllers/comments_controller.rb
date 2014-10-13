class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:create, :destroy]
  before_action :need_basic_rank, only: :create
  before_action :destroy_right, only: :destroy

  def create
    @comment = @todo.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    Event.create(user_id:current_user.id, action:"回复了", 
                todo_id:@comment.todo_id, content:@comment.body)

    redirect_to project_todo_path(@project,@todo)
  end

  def destroy
    @comment.destroy
    redirect_to project_todo_path(@project,@todo)
  end 

  private
    def comment_params
      params.require(:comment).permit(:todo_id, :body, :user_id)
    end

    def set_todo
      @project = Project.find(params[:project_id])
      @team = @project.team
      @todo = @project.todos.find(params[:todo_id])
    end

    def need_basic_rank
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:[2,3]) or Access.find_by(user_id:current_user.id, rank:4)
    end

    def destroy_right
      @comment = @todo.comments.find(params[:id])
      redirect_to @team unless Access.find_by(user_id:current_user.id, project_id:@project.id, rank:3) or Access.find_by(user_id:current_user.id, rank:4) or current_user == @comment.user
    end

end
