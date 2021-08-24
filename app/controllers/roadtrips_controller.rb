class RoadtripsController < ApplicationController
  before_action :roadtrip_id, only: %i[show edit update delete]
  def index
    @roadtrips = Roadtrip.all
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

  def delete
    @roadtrip.destroy
  end

  private
  def roadtrip_id
    @roadtrip = Roadtrip.find(params_id)
  end

  def roadtrip_params
    params.require(:roadtrip).permit(:title)
  end
end
