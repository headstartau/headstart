class PagesController < ApplicationController

  def index
  	@events = Event.where('starts_at > ?', Time.now).order(:starts_at)
  end

end
