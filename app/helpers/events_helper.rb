module EventsHelper

  def event_date(date)
    date.strftime("%d/%m/%Y")
  end

  def can_edit?(event)
    event.creator.id == current_user.id
  end
  
end
