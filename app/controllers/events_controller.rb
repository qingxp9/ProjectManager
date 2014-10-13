class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.paginate(page: params[:page])
  end

  #def create
  #  @event = Event.build(event.params)
  #  if @event.save
  #    redirect_to current_user.team
  #  else
  #    render 'new'
  #  end
  #end

  #def new
  #  @event = Event.new
  #end

  #def destroy
  #  @event = Event.find(params[:id])
  #  @event.destroy
  #end

  private

  def event_params
    params.require(:user).permit(:user_id, :todo_id, :action, :content)
  end

end

