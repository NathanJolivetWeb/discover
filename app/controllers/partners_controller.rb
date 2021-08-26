class PartnersController < ApplicationController
  def new
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
  end

  private

  def partner_params
    params.require(:partner).permit(:user, :roadtrip)
  end
end
