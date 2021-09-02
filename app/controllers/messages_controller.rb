class MessagesController < ApplicationController

  def create
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @message = Message.new(message_params)
    @message.roadtrip = @roadtrip
    @message.user = current_user

    if @message.save
      RoadtripChannel.broadcast_to(
        @roadtrip,
        {
          message: render_to_string(partial: "message", locals: { message: @message, receiver: true }),
          sender_id: current_user.id
        }
      )
      redirect_to request.referrer
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
