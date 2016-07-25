class MapsController < ApplicationController

  def index
    @user = current_user
  end

  def create
   map = Map.create(map_params)
    map.user = current_user
    if map.save
      redirect_to user_path(current_user.id), notice: "Map created."
    else
      redirect_to root_path, notice: "Sorry, I can't save a blank map."
    end
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
    user = current_user
    map = Map.find(params[:id])
    data = JSON.parse(map.data)
    blue_EV = data["blue"]
    red_EV = data["red"]
    unassigned_EV = 538 - (blue_EV + red_EV)
    map.update(map_params)
    redirect_to user_map_path(user, map), notice: "Map updated."
  end

  def destroy
    user = current_user
    @map = Map.find(params[:id])
    @map.destroy
    respond_to do |format|
      format.js { render "destroy"}
    end
    # redirect_to user_path(current_user.id)
  end

  private

  def map_params
    params.require(:map).permit(:user_id, :name, :data)
  end

end
