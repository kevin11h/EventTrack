class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @events = current_user.events.first(4)
      @invites = current_user.invites.first(4)
    end
  end

end
