class PostsController < ApplicationController
before_action :set_post, only:[:update,:show,:edit,:destroy]
  def index
    @posts = Post.page(params[:page]).order('created_at DESC').per(6).includes(:user,:images)
    @first_post = @posts.first
 
  end

  def new 
    @post = Post.new
    @post.images.new
  end

  def show
    @like = Like.new
    @comments = @post.comments
    @comment =Comment.new
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @Industry_parents = Industry.all.where(ancestry: nil).limit(14)
    @Occupation_parents = Occupation.all.where(ancestry: nil).limit(15)

    if params[:word]
      @posts = Post.page(params[:page]).search(params[:word]).order('created_at DESC').per(6).includes(:user,:images)
      render :index
    else
      render :search
    end

  

  end

  def industrycategory
    @industry = Industry.find(params[:id])
    @users =User.where(industry_id: @industry.id)
    @posts = Post.page(params[:page]).where(user_id: @users.ids).order('created_at DESC').per(6).includes(:user,:images)
    render :index
  
  end 

  def occupationcategory
    @occupation = Occupation.find(params[:id])
    @users =User.where(occupation_id: @occupation.id)
    @posts = Post.page(params[:page]).where(user_id: @users.ids).order('created_at DESC').per(6).includes(:user,:images)
    render :index
  
  end 



  def edit 
    render :new
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

    if @post.update(strong_param)
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


