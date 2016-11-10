class StaticPagesController < ApplicationController  
  before_action :authenticate_user!, only: :dashboard

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    @events = current_user.events.last(4)
    @invites = current_user.invites.last(4)
  end

end
