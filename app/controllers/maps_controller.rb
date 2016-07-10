class MapsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    @map = Map.create(map_params)
    binding.pry
    @map.user = current_user
    binding.pry
    # save the colors of the states
    @map.save
    binding.pry
  end


  private

  def map_params
    params.require(:map).permit(:user_id, :name, :blue, :red, :gray)
  end

end
