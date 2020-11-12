class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params.require(:message).permit(:content))
    @message.save!
    ActionCable.server.broadcast('message_channel', message: (render @message))
    head :ok
  end
end
