class ParticipationsController < ApplicationController
  def new
    @mission = Mission.find(params[:mission_id])
    @participation = Participation.new
  end

  def create
    @participation = Participation.new
    @mission = Mission.find(params[:mission_id])
    @participation.mission = @mission
    @participation.user = current_user

    if @mission.number_of_participants > @mission.participations.count
      condition = true
    else
      condition = false
    end
    @condition = condition

    if @condition == true
      if @participation.save
        redirect_to mission_path(@participation.mission.id), notice: 'Participation was successfully created.'
      else
        render :new
      end
    else
      flash[:alert] = 'ERREUR : Nombre max de participants atteint.'
      redirect_to mission_path(@participation.mission.id)
      # , alert: 'ERREUR : Nombre max de participants atteint.'
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    # redirect_to @participation.mission, notice: 'Participation was successfully destroyed.'
    redirect_to dashboard_path, notice: 'Participation was successfully destroyed.'
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :mission_id)
  end
end
