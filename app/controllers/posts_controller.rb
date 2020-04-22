class PostsController < ApplicationController
before_action :set_post, only:[:update,:show,:edit]
  def index
    @posts = Post.page(params[:page]).order('created_at DESC').per(6).includes(:user,:images)
    @first_post = @posts.first
 
  end

  def new 
    @post = Post.new
    @post.images.new
  end

  def show
 
  end

  def create 
    post = Post.new(strong_param)
    if post.save!
      redirect_to root_path
    else 
      render :new 
    end
  end

  def update

    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def strong_param
    params.require(:post).permit(:title,:content, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)

  end
  def set_post
    @post = Post.find(params[:id])
  end
end
