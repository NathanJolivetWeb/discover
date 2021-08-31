class PartnersController < ApplicationController
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
    redirect_to new_roadtrip_partner_path(@roadtrip)
  end

  private

  def partner_params
    params.require(:partner).permit(:user_id)
  end
end
