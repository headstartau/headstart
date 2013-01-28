class EventsController < ApplicationController

  def index
    @users = Event.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = Event.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

end
