class InvitesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find_by(id: params[:invite][:event_id])

    if event.nil?
      flash[:danger] = 'Event not found'
      redirect_to request.referer || events_path
    end

    user = User.find_by(email: params[:invite][:email])

    if user.nil?
      flash[:danger] = 'User not found'
      redirect_to request.referer || events_path
    elsif event.creator != current_user
      flash[:danger] = "This event doesn't belong to this user"
      redirect_to request.referer || events_path
    elsif user == event.creator
      flash[:danger] = "You can't invite yourself"
      redirect_to event
    else
      @invite = event.invites.build(attendee: user)
      if @invite.save
        respond_to do |format|
          format.js
        end
      else
        flash[:danger] = 'Failed to create invite'
        redirect_to request.referer || events_path
      end
    end
  end

  def confirm
    @invite = Invite.find_by(id: params[:id])
    if (@invite.attendee.id = current_user.id)
      @invite.confirm_invite
      if @invite.save
        respond_to do |format|
          format.js
        end
      else
        redirect_to request.referer || events_path
      end
    else
      flash[:danger] = "This invite doesn't belongs to you"
      redirect_to request.referer || events_path
    end
  end

  def index
    @invites = current_user.invites.paginate page: params[:page] unless
      current_user.nil?
  end

end
