class PostsController < ApplicationController
before_action :set_post, only:[:new]
  def index
    
  end

  def new 
    
  end

  private
  def set_post
    @post = Post.new
  end
end
