class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @events = current_user.events
      @invites = current_user.attended_events
    end
  end

end
