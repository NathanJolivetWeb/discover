class StepsController < ApplicationController
  before_action :params_id, only: :destroy
  before_action :set_itinerary, only: %i[create new]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      @itinerary_step = ItineraryStep.create(step:@step, itinerary: @itinerary)
      redirect_to itinerary_path(@itinerary)
    else
      render "itinerary/show"
    end
  end

  def destroy
    @step.destroy
    itinerary = params[:itinerary]
    redirect_to itinerary_path(itinerary)
  end

    private

  def params_id
    @step = Step.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def step_params
    params.require(:step).permit(:address)
  end
end
