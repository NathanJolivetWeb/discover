class RoadtripChannel < ApplicationCable::Channel
  def subscribed
    roadtrip = Roadtrip.find(params[:id])
    stream_for roadtrip
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
