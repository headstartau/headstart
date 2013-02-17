class SessionsController < ApplicationController
  layout 'one-col'

  def new
  end

  def create
    if params[:provider]
      user = User.find_or_create_from_auth_hash(auth_hash)
      auto_login(user)
    else
      user = login(params[:email], params[:password], params[:remember_me])
    end

    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
