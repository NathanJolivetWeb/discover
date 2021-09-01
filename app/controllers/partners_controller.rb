class PartnersController < ApplicationController
  before_action :partner_id, only: %i[destroy edit update]
  def new
    @addressed = Friendship.where(addressed: current_user.id)
    @requester = Friendship.where(requester: current_user.id)
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @partner = Partner.new
  end

  def create
    @ids = params[:partner][:user]
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @ids.shift
    @ids.each do |id|
      @partner = Partner.new(user_id: id, roadtrip: @roadtrip)
      @partner.save!
    end
    redirect_to roadtrip_path(@roadtrip)
  end

  def edit
  end

  def update
  end

  def destroy
    @partner.roadtrip = @roadtrip
    @partner.destroy
    redirect_to roadtrip_path(@roadtrip)
  end

  private

  def partner_id
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:user_id)
  end
end
