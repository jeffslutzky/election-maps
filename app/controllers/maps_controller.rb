class MapsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    @map = Map.create(map_params)
    @map.user = current_user
    respond_to do |format|
      format.js { }
    end
    binding.pry
    # save the colors of the states
    @map.save
  end


  private

  def map_params
    params.require(:map).permit(:user_id, :name, :blue, :red, :gray)
  end

end
