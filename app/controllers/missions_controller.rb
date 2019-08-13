class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])


  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to @mission, notice:"mission was successfully created"
    else
      render :new
    end
  end
end

#def edit
 #end
  #def update
    #if @mission.update(mission_params)
      #redirect_to @mission, notice: 'Mission was successfully updated.'
    #else
      #render :edit
    #end
  #end
  #def destroy
    #@mission.destroy
    #redirect_to missions_url, notice: 'Mission was successfully destroyed.'
  #end

private

  def mission_params
    params.require(:mission).permit(:title, :category, :description, :reward, :place, :start_date, :end_date, :number_of_participants)
  end
  def set_mission
    @mission = Mission.find(params[:id])

end
