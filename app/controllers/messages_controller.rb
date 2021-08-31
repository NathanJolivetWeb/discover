class MessagesController < ApplicationController
  
  def create
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @message = Message.new(message_params)
    @message.roadtrip = @roadtrip
    @message.user = current_user
    
    if @message.save
      # request.referrer is the url we are
      url = request.referrer
      redirect_to "#{url}?room=#{@roadtrip.id}"
    end

    # ActionCable a faire
    # RoadtripChannel.broadcast_to(
    #   @roadtrip,
    #   render_to_string(partial: "message", locals: { message: @message })
    # )
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
