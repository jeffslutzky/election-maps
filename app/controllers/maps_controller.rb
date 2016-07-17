class MapsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    map = Map.create(map_params)
    map.user = current_user
    map.save
    binding.pry
    redirect_to user_path(current_user.id)
  end


  def show
    @user = current_user
    @map = Map.find(params[:id])
  end


  private

  def map_params
    params.require(:map).permit(:user_id, :name, :blue, :red, :blue_states, :red_states, :gray, :data)
  end

end
