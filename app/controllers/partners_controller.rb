class PartnersController < ApplicationController
  def new
    @addressed = Friendship.where(addressed: current_user.id)
    @requester = Friendship.where(requester: current_user.id)
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @partner.roadtrip = @roadtrip

    if @partner.save
      redirect_to new_roadtrip_partner_path(@roadtrip)
    else
      render 'new'
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:user_id)
  end
end
