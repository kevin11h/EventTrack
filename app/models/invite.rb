class Invite < ActiveRecord::Base
  before_create :set_peding
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"

  private
    def set_peding
      self.status = 'Pending'
    end
end
