class GroupsController < ApplicationController
  def index

  end

  def new
    @group = Group.new
    @group.users << current_user

    @users = current_user.followings
  
  end

  def show 
    @group = Group.find(params[:id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def destroy
    groups = Group.find(params[:id])
    if groups.users.delete(current_user)
      redirect_to root_path
    else
      render :new
    end
  end

  def menber
    @group = Group.find(params[:id])
  
  end

  def create
    group = Group.new(strong_params)

    if group.save
      redirect_to groupss_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = current_user.followings
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(strong_params)
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
