class CreateInvite

  attr_reader :event, :errors, :invitation

  def initialize(event_id, user)
    @event = Event.find_by id: event_id
    @user  = User.find user.id
    @errors = []
  end

  def invite(email)
    @created = false
    return unless validate_creator
    @attendee = User.find_by email: email 
    return unless validate_attendee
    @invitation = @event.invites.build(attendee: @attendee)
    @created = @invitation.save
  end

  def created?
    @created
  end

  private

  def validate_creator
    if @event.creator == @user
      true
    else
      @errors << "This event doesn't belong to this user"
      false
    end
  end

  def validate_attendee
    if @attendee.nil?
      @errors << 'User not found'
      return false
    end

    if @attendee == user
      @errors << "You can't invite yourself"
      return false
    end
    true
  end

  attr_accessor :user, :created, :attendee
end
