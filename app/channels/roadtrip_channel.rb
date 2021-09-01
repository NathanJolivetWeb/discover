class RoadtripChannel < ApplicationCable::Channel
  def subscribed
    roadtrip = Roadtrip.find(params[:room])
    stream_for roadtrip
    raise
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
