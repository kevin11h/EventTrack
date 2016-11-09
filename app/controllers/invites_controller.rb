class InvitesController < ApplicationController
  before_action :authenticate_user!

  def create
    @service = CreateInvite.new params[:invite][:event_id], current_user
    @service.invite params[:invite][:email]
    @invite = @service.invitation
    respond_to { |format| format.js }
  end

  def confirm
    @invite = Invite.find_by(id: params[:id])

    unless invite_belongs_to_current_user @invite
      flash[:danger] = "This invite doesn't belongs to you"
      redirect_to request.referer || events_path
    end

    if @invite.confirm_invite
      respond_to { |format| format.js }
    else
      redirect_to request.referer || events_path
    end
  end

  def index
    @invites = current_user.invites.paginate page: params[:page] unless
      current_user.nil?
  end

  private

  def load_event(event)
    @event = event
    @invites = Invite.eager_load(:attendee).where(attended_event_id: @event.id)
  end

  def invite_belongs_to_current_user(invite)
    invite.attendee.id == current_user.id
  end

end

