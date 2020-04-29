class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = current_user.followings

  end

  def create
    group = Group.new(strong_params)
    if group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  private
  def strong_params
    params.require(:group).permit(:name, user_ids: [])
  end
end