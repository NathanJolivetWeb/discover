class RoadtripChannel < ApplicationCable::Channel
  def subscribed
    roadtrip = Chatroom.find(4)
    stream_for roadtrip
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
