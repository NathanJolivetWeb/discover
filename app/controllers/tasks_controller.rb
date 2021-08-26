class TasksController < ApplicationController
  before_action :params_id, only: %i[show edit update destroy]
  before_action :roadtrip_id, only: %i[new create]

  def new
    @task = Task.new
  end

  def create
    raise
    @task = Task.new(task_params)
    @task.roadtrip = @roadtrip

    if @task.save
      redirect_to roadtrip_path(@roadtrip.id)
    end

    redirect_to roadtrip_path(@roadtrip.id)
  end

  def index
  end

  private

  def roadtrip_id
    @roadtrip = Roadtrip.find(params[:roadtrip_id])
  end

  def params_id
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(content: "")
  end
end
