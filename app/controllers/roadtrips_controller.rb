class RoadtripsController < ApplicationController
  before_action :roadtrip_id, only: %i[show edit update destroy]
  def index
    @roadtrips = current_user.roadtrips
  end

  def show
  end

  def new
    @roadtrip = Roadtrip.new
  end

  def create
    @roadtrip = Roadtrip.new(roadtrip_params)
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
