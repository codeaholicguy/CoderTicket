class EventsController < ApplicationController
  def index
    @events = Event.upcoming_events
  end

  def my_events
    @events = current_user.events
  end

  def new
    @event = Event.new
    @event.build_venue
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "Event created successfully"
      redirect_to events_path
    else
      @event.build_venue()
      flash[:warning] = "Something went wrong, try again later."
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    render 'edit'
  end

  def publish
    @event = Event.find(params[:id])
    @event.published = true
    if @event.save
      flash[:success] = "Event updated successfully"
      redirect_to my_events_path
    else
      flash[:warning] = "Something went wrong, try again later."
      redirect_to my_events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :extended_html_description, :category_id,:user_id,
                                    :hero_image_url,
                                    ticket_types_attributes:[:id, :name, :price,:max_quantity,:_destroy],
                                    venue_attributes:[:name, :region_id])
  end
end
