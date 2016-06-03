class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @events = current_user.events.last(4)
      @invites = current_user.invites.last(4)
    end
  end

end
