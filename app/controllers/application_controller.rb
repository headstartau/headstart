class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'one-col'

  def not_authenticated
    redirect_to :login, :alert => "You need to be logged in to access that page."
  end
end
