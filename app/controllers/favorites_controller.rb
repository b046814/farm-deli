class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: [:create, :destroy]


  def create
    @favorite = Favorite.new(user_id: current_user.id, farm_id: params[:farm_id])
    if @favorite.save
    else
      redirect_to farm_path(params[:farm_id])
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, farm_id: params[:farm_id])
    if favorite.destroy
    else
      redirect_to farm_path(params[:farm_id])
    end
  end

  private

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

end
