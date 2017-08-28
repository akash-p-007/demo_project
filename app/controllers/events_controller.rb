class EventsController < ApplicationController
	before_filter :authenticate_user!
  load_and_authorize_resource
  def index
  		@events = Event.all.where(calendar: current_user.email)
  end
end
