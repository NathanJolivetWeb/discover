class ItinerariesController < ApplicationController
  def new
  end

  def show
    @itineraries = Itinerary.all
  end

  def index
    @itineraries = Itinerary.all
  end

  def edit
  end
end
