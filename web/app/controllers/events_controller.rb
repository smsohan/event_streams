class EventsController < ApplicationController

  respond_to :html, :json

  def index
    @events = Event.filter(params[:query])
  	respond_with @events
  end

  def create
    @event = Event.create!(params[:event])
    respond_with @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_with @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    respond_with @event
  end

end
