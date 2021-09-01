class RoadtripsController < ApplicationController
  before_action :roadtrip_id, only: %i[show edit update destroy]

  def index
    @roadtrips = current_user.roadtrips
    @roadtrips_status_en_cours = @roadtrips.where(status: "En cours")
    @roadtrips_status_termine = @roadtrips.where(status: "Terminé")
  end

  def show
    @itinerary = Itinerary.new
    @task = Task.new
    @message = Message.new
    @roadtrips = Roadtrip.all
  end

  def new
    @roadtrip = Roadtrip.new

    @roadtrips = Roadtrip.all
    @roadtrips_dates = @roadtrips.map do |roadtrip|
      {
        from: roadtrip.start_date,
        to: roadtrip.end_date
      }
    end
  end

  def create
    @roadtrip = Roadtrip.new(roadtrip_params)
    @roadtrip.owner = current_user.id
    if @roadtrip.save
      @partner = Partner.create!(user: current_user, roadtrip: @roadtrip)
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
    params.require(:roadtrip).permit(:title, :owner, :start_date, :end_date)
  end
end
