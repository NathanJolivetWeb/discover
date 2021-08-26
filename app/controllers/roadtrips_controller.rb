class RoadtripsController < ApplicationController
  before_action :roadtrip_id, only: %i[show edit update destroy]
  def index
    @roadtrips = current_user.roadtrips
    @roadtrips_status_en_cours = @roadtrips.where(status: "En cours")
    @roadtrips_status_termine = @roadtrips.where(status: "Terminé")
  end

  def show
    @itinerary = Itinerary.new
  end

  def new
    @roadtrip = Roadtrip.new
  end

  def create
    @roadtrip = Roadtrip.new(roadtrip_params)

    if @roadtrip.save
      redirect_to roadtrip_path(@roadtrip)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @roadtrip = Roadtrip.new(roadtrip_params)
    @roadtrip.update
  end

  def destroy
    @roadtrip.destroy
    redirect_to roadtrips_path
  end

  private
  def roadtrip_id
    @roadtrip = Roadtrip.find(params[:id])
  end

  def roadtrip_params
    params.require(:roadtrip).permit(:title)
  end
end
