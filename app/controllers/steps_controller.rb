class StepsController < ApplicationController
  before_action :set_itinerary, only: %i[create new]
  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save!
      @itinerary_step = ItineraryStep.create(step:@step, itinerary: @itinerary)
      redirect_to itinerary_path(@itinerary)
    else
    end
  end

    private

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def step_params
    params.require(:step).permit(:address)
  end
end
