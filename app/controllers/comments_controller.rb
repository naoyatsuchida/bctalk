class CommentsController < ApplicationController
  def create
    @comment = Comment.new(strong_params)
    @comment.user_id = current_user.id
    if @comment.save 
        redirect_to root_path
      else 
    
        redirect_to root_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private
  def strong_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
