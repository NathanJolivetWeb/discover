class PartnersController < ApplicationController
  before_action :partner_id, only: %i[destroy edit update]
  def new
    @addressed = Friendship.where(addressed: current_user.id)
    @requester = Friendship.where(requester: current_user.id)
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @partner = Partner.new
    @partners = @roadtrip.users.map { |partner| partner.id }
  end

  def create
    @partner = Partner.new(partner_params)
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
    @partner.roadtrip = @roadtrip
    if @partner.save!
      render json: { success: true, partner: @partner.id }
    else
      render json: { success: false, errors: @partner.errors.messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @partner.destroy
    render json: { success: true }
  end

  private

  def partner_id
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:user_id, :roadtrip_id)
  end
end
