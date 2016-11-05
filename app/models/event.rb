class Event < ApplicationRecord
  scope :newest, -> { order("date desc") }
  belongs_to :creator, :class_name => "User"

  has_many :invites, foreign_key: :attended_event_id
  has_many :attendees, through: :invites, :source => :attendee

  self.per_page = 20
end
