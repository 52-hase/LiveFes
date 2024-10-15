class LiveEventsController < ApplicationController
  def index
    @live_events = LiveEvent.all
  end

  def show
    @live_event = LiveEvent.find(params[:id])
  end
end
