class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @event.save
  end

  def index
    @events = Event.paginate(page: params[:page])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:user).permit(:user_id, :todo_id, :action, :content)
  end
end

