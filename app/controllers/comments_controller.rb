class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @todo = @project.todos.find(params[:todo_id])
    @comment = @todo.comments.create(comment_params)
    redirect_to project_todo_path(@project,@todo)
  end

  def edit
    @project = Project.find(params[:project_id])
    @todo = @project.todos.find(params[:todo_id])
    @comment=@todo.comments.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:project_id])
    @todo = @project.todos.find(params[:todo_id])
    @comment=@todo.comments.find(params[:id])
    @comment.destroy
    redirect_to project_todo_path(@project,@todo)
  end 

  def update
    @project = Project.find(params[:project_id])
    @todo = @project.todos.find(params[:todo_id])
    @comment=@todo.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
