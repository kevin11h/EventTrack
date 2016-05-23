class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @events = current_user.events
      @invites = current_user.invites
    end
  end

end
