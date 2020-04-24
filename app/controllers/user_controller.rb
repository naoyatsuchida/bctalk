class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    @following_count = @user.followings.count
    @follower_count = @user.followers.count
  end
end
