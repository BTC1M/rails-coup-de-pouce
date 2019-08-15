class ParticipationsController < ApplicationController
  def new
    @mission = Mission.find(params[:mission_id])
    @participation = Participation.new
  end

  def create
    @participation = Participation.new(participation_params)
    @mission = Mission.find(params[:mission_id])
    @participation.mission = @mission
    @participation.user = current_user
    if @participation.save
      redirect_to mission_path(@participation.mission.id), notice: 'Participation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    # redirect_to @participation.mission, notice: 'Participation was successfully destroyed.'
    redirect_to dashbord_path, notice: 'Participation was successfully destroyed.'
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :mission_id)
  end
end
