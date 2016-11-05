class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events, :foreign_key => "creator_id", :class_name => "Event"

  has_many :invites, :foreign_key => "attendee_id"
  has_many :attended_events, through: :invites, :source => :attended_event
end
