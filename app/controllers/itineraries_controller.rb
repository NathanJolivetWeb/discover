class ItinerariesController < ApplicationController
  before_action :roadtrip_id, only: %i[new create]

  def new
    @itinerary = Itinerary.new
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @step = Step.new()
    @markers = @itinerary.steps.map{ |step| {lat: step.latitude, lng: step.longitude}}
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
  end

  def index
    @itineraries = Itinerary.all
  end

  def edit
  end

  def create
    @itinerary = Itinerary.new(name: "Nouveau Itinéraire")
    @itinerary.roadtrip_id = @roadtrip.id
    if @roadtrip.itineraries.size.zero?
      if @itinerary.save
        redirect_to @itinerary
      else
        redirect_to roadtrip_path(@roadtrip)
      end
    else
      @last_step_of_previous_itinerary = @roadtrip.itineraries.last.steps.last
      if @itinerary.save
        ItineraryStep.create!(step: @last_step_of_previous_itinerary, itinerary: @itinerary)
        redirect_to @itinerary
      else
        redirect_to roadtrip_path(@roadtrip)
      end
    end
  end

  private

  def roadtrip_id
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:name, :distance, :duration)
  end

end
