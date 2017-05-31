class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:offer).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end
