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


  def show
    @user = current_user
    @map = Map.find(params[:id])
    @data = JSON.parse(@map.data)
    @blue_EV = @data["blue"]
    @red_EV = @data["red"]
    @unassigned_EV = 538 - (@blue_EV + @red_EV)
  end


  def update
    @user = current_user
    @map = Map.find(params[:id])
    @data = JSON.parse(@map.data)
    @blue_EV = @data["blue"]
    @red_EV = @data["red"]
    @unassigned_EV = 538 - (@blue_EV + @red_EV)
    @map.update(map_params)
    redirect_to user_map_path(@user, @map)
  end

  private

  def map_params
    params.require(:map).permit(:user_id, :name, :data)
  end

end
