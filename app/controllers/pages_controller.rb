class PagesController < ApplicationController

  def index
    render :layout => "one-col"
    @events = Event.where('starts_at > ?', Time.now).order(:starts_at)
  end

  def event
    render :layout => "two-col"
  	@events = Event.where('starts_at > ?', Time.now).order(:starts_at)
  end

end
