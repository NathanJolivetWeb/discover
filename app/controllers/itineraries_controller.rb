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
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.roadtrip = @roadtrip
    if @itinerary.save
      redirect_to itineraries_path
    else
      render 'new'
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
