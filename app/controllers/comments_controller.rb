class CommentsController < ApplicationController
  def create
    @comment = Comment.new(strong_params)
    @comment.user_id = current_user.id
    if @comment.save 
        render :show
    else 
      render :show
  end
  private
  def strong_params
    params.require(:comment).permit(:comment)
  end
end
