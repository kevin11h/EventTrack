class Event < ApplicationRecord
  scope :newest, -> { order('date desc') }
  belongs_to :creator, class_name: 'User'

  has_many :invites, foreign_key: :attended_event_id
  has_many :attendees, through: :invites, source: :attendee

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :date, presence: true
  validate  :cannot_be_past_today

  self.per_page = 20

  private

  def cannot_be_past_today
    return if date.blank? || date.nil?
    errors.add(:date, "can't be past today!") if date.to_date < Time.now.to_date
  end
end
