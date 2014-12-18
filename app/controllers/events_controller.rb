class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

# Show/ Search all events #

def index
  #@events = Event.current_events.all
  @events = Event.search_event(params[:n],params[:d],params[:t])
end

# Show one event #

def show
  @event = Event.find(params[:id])
end

# Create new event as a creator #

def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
  if @event.save
    @event.current_attendee = 0 #assume creator is also attendee
    flash[:notice] = "Event successfully saved"
    redirect_to @event
  else
    flash[:error] = "There was a problem with your input"
    render :new
    # redirect_to new_event_path
  end
end

# Edit / Cancel event as a creator !! future user story - send notification email # #

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update_attributes(event_params)
    flash[:notice] = "Event successfully updated"
    redirect_to @event
  else
    flash[:error] = "There was a problem with your input"
    render :edit
  end
 end

# Join and leave event as an attendee #

def join
  @event = Event.find(params[:id])
  if @event.max_attendee <= @event.attendees.count
    flash[:error] = "The event is full"
    redirect_to @event
  elsif
    current_user.attendances.include?(@event)
    flash[:error] = "You have already joined this event"
    redirect_to @event
  else
    current_user.attendances << @event
    flash[:notice] = "Event successfully joined"
    redirect_to @event
  end
end

def leave
  @event = Event.find(params[:id])
  if current_user.attendances.include?(@event)
    @event.current_attendee -=1
    current_user.attendances.delete(@event)
    flash[:notice] = "Event successfully left"
    redirect_to @event
  else
    flash[:error] = "You did not join this event"
    redirect_to @event
  end
end

# Destroy event as a creator - only available after cancellation #
def destroy
  @event = Event.find(params[:id])
  @event.destroy
  flash[:notice] = "Event successfully deleted"
  redirect_to :action => :index, status: 303
end

private
  def event_params
    params.require(:event).permit(:name, :date, :time, :district_id, :address, :max_attendee, :current_attendee, :description, :user_id)
  end
end
