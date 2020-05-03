class MessagesController < ApplicationController

  def index 

  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.new(message_params)
  
  if @message.save
    # respond_to do |format|
    #   format.json
    # end
    redirect_to root_path
  else
    @messages = @group.messages.includes(:user)
    flash.now[:alert] = 'メッセージを入力してください。'
    render :index
  end
end

private
def message_params
  params.require(:message).permit(:content, :images).merge(user_id: current_user.id) 
end
end
