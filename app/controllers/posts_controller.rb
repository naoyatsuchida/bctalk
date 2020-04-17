class PostsController < ApplicationController
before_action :set_post, only:[:new]
  def index
    
  end

  def new 
    
  end

  def create 
    post = Post.new(strong_param)
    if post.save
      redirect_to root_path
    else 
      render :new 
    end
  end

  private
  def strong_param
    params.require(:post).permit(:title,:content).merge(user_id: current_user.id)

  end
  def set_post
    @post = Post.new
  end
end
