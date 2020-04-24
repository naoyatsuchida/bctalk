class RelationshipsController < ApplicationController
  def following
    user = User.find(params[:id])
    @user = user.followings
  end

  def follower
    user = User.find(params[:id])
    @user = user.followers
    render :following
  end

  def create
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @user
    end
  end

 
end
