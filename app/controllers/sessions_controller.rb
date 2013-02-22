class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by_name(params[:name])
    if u.present?
      if u.authenticate(params[:password])
        session[:username] = u.name
        redirect_to root_url, notice: "You've been logged in"
      end
    else
      redirect_to root_url, notice: 'Nice try'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "You've been logged out"
  end
end
