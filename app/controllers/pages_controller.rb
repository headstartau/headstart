class PagesController < ApplicationController

  def index
    @events = Event.all
    render :layout => "one-col"
  end

  def event
    @events = Event.where('starts_at > ?', Time.now).order(:starts_at)
    render :layout => "two-col"
  end

end
