class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @users = User.all
  end

  def dashboard
    @missions = Mission.all
  end
end
