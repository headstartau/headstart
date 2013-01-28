class PagesController < ApplicationController
  def index
    render :layout => "one-col"
  end

  def event
    render :layout => "two-col"
  end
end
