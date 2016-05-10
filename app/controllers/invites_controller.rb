class InvitesController < ApplicationController

  def create  
    event = Event.find_by(id: params[:invite][:event_id])
    if event.nil?
      flash[:danger] = "Event not found"
      redirect_to request.referer || events_path
    end
    user = User.find_by(id: params[:invite][:user_id])
    if user.nil?
      flash[:danger] = "User not found"
      redirect_to request.referer || events_path
    else
      @invite = event.invites.build(attendee: user)
      if @invite.save
        flash[:success] = "Friend invited with success"
        redirect_to event
      else
        flash[:danger] = "Failed to create invite"
        redirect_to request.referer || events_path
      end
    end
  end

end
