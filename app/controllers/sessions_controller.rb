class SessionsController < ApplicationController

  def new
    @user = current_user
    @blue_EV = 0
    @red_EV = 0
    @unassigned_EV = 538
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to root_path(current_user.id)
    else
      flash.now[:alert] = "I don't seem to know that user. Please try logging in again, or click \"Sign up\" if you are a new user."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
