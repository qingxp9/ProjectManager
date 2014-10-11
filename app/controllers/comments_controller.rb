class CommentsController < ApplicationController
  before_action :set_todo, only: [:create, :destroy]
  def create
    @comment = @todo.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    Event.create(user_id:current_user.id, action:"回复了", 
                todo_id:@comment.todo_id, content:@comment.body)

    redirect_to project_todo_path(@project,@todo)
  end

  def destroy
    @comment=@todo.comments.find(params[:id])
    @comment.destroy
    redirect_to project_todo_path(@project,@todo)
  end 

  private
    def comment_params
      params.require(:comment).permit(:todo_id, :body, :user_id)
    end

    def set_todo
      @project = Project.find(params[:project_id])
      @todo = @project.todos.find(params[:todo_id])
    end
end
