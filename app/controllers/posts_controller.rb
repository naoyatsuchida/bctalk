class PostsController < ApplicationController
before_action :set_post, only:[:new]
  def index
    @posts = Post.page(params[:page]).order('created_at DESC').per(6).includes(:user,:images)
    @first_post = @posts.first
 
  end

  def new 
    @post = Post.new
    @post.images.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create 
    post = Post.new(strong_param)
    if post.save!
      redirect_to root_path
    else 
      render :new 
    end
    
  end

  private
  def strong_param
    params.require(:post).permit(:title,:content, images_attributes: [:src]).merge(user_id: current_user.id)

  end
  def set_post
    @post = Post.new
  end
end
