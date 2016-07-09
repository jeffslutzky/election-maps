class MapsController < ApplicationController

  def index
    @user = current_user
    @map = Map.new
  end

  def create
    binding.pry
    map = Map.create(map_params)
    map.user = current_user
    # save the colors of the states
    map.save
  end


  private

  def map_params
    params.require(:map).permit(:user_id, :blue, :red, :gray)
  end

end
