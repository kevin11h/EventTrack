class Invite < ApplicationRecord

  before_create :set_peding
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  def confirm_invite
    update_attribute :status, 'Confirmed'
  end

  private

  def set_peding
    self.status = 'Pending'
  end
end
