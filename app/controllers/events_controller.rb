class EventsController < ApplicationController
def index
    @events = Event.where('district LIKE :query', query: "%#{params[:q]}%")
end

def show
    @event = Event.find(params[:id])
end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully saved"
      redirect_to @event
    else
      flash[:error] = "There was a problem with your input"
      render :new
      # redirect_to new_event_path
    end
  end

private
  def event_params
    params.require(:event).permit(:name, :date, :time, :district, :address,
     :max_attendee, :current_attendee, :description, :user_id)
  end
end


