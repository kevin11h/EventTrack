class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :correct_user, only: [:edit,:update]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      flash[:success] = "Event created"
      redirect_to @event
    else
      flash.now[:danger] = "Failed to create event"
      render :new
    end
  end

  def index
    @events = []
    @events = current_user.events.paginate(page: params[:page]).newest unless current_user.nil?
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event.destroy
    flash[:success] = "Event deleted with success"
    redirect_to request.referrer || root_url
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      flash.now[:danger] = "Failed to update event"
      render :edit
    end
  end

  private
    def events_params
      params.require(:event).permit(:name, :date, :description)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to request.referrer || root_url if @event.nil?
    end

  

end
