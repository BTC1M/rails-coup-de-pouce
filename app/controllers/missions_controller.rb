class MissionsController < ApplicationController
  before_action :set_mission, only: [:edit, :update, :destroy]

  def index
    @missions = Mission.geocoded # returns missions with coordinates

    @markers = @missions.map do |mission|
      {
        lat: mission.latitude,
        lng: mission.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { mission: mission }),
        image_url: helpers.asset_url('pouce-bleu.png')
      }
    end
  end

  def show
    @mission = Mission.find(params[:id])
    @nombre = @mission.number_of_participants - @mission.participations.count

    @markers = [
      {
        lat: @mission.latitude,
        lng: @mission.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { mission: @mission }),
        image_url: helpers.asset_url('pouce-bleu.png')
      }
    ]
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    if @mission.save
      redirect_to @mission, notice: "Mission was successfully created"
    else
      render :new
    end
  end

def edit; end

def update
  if @mission.update(mission_params)
    redirect_to @mission, notice: 'Mission was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @mission.destroy
  redirect_to dashboard_path, notice: 'Mission was successfully destroyed.'
end

private

  def mission_params
    params.require(:mission).permit(:title, :category, :description, :reward, :place, :start_date, :end_date, :number_of_participants)
  end
  def set_mission
    @mission = Mission.find(params[:id])
  end
end
