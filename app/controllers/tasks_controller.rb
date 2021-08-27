class TasksController < ApplicationController
  before_action :params_id, only: :destroy
  before_action :roadtrip_id, only: %i[create]

  def create
    @task = Task.new(task_params)
    @task.roadtrip_id = @roadtrip.id

    if @task.save
      redirect_to roadtrip_path(@roadtrip)
    else
      render "roadtrips/show"
    end
  end

  def destroy
    @task.destroy
    redirect_to roadtrip_path(@task.roadtrip_id)
  end

  private

  def roadtrip_id
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
  end

  def params_id
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content)
  end
end
