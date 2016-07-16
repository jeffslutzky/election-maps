class MapsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    map = Map.create(map_params)
    map.user = current_user
    map.save
    redirect_to user_path(current_user.id)
  end


  private

  def map_params
    params.require(:map).permit(:user_id, :name, :blue, :red, :blue_states, :red_states, :gray)
  end

end
