class ItinerariesController < ApplicationController

  before_action :roadtrip_id, only: %i[new create]
  def new
    @itinerary = Itinerary.new
  end

  def show
    @itineraries = Itinerary.all
  end

  def index
    @itineraries = Itinerary.all
  end

  def edit
  end

  def create
    @itinerary = Itinerary.new(name: "Nouveau Itinéraire")
    @itinerary.roadtrip_id = @roadtrip.id
    if @itinerary.save
      redirect_to roadtrip_path(@roadtrip)
    else
      redirect_to roadtrip_path(@roadtrip)
    end
  end

  private

  def roadtrip_id
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:address_start, :address_end)
  end

end
