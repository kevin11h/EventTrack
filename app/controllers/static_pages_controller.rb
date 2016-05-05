class StaticPagesController < ApplicationController

  def home
    @events = current_user.events unless current_user.nil?
  end

end
