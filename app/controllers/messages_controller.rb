class MessagesController < ApplicationController

  def index 

  end

  def create

    @message = @group.messages.new(message_params)
  binding.pry
  if @message.save
    # respond_to do |format|
    #   format.json
    # end
    render :show
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
