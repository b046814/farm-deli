class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: [:create, :destroy]


  def create
    @favorite = Favorite.new(user_id: current_user.id, farm_id: params[:farm_id])
    if @favorite.save
      redirect_to farm_path(params[:farm_id]), success: 'いいねしました'
    else
      redirect_to farm_path(params[:farm_id]), success: 'いいねに失敗しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, farm_id: params[:farm_id])
    if favorite.destroy
      redirect_to farm_path(params[:farm_id]), success: 'いいねを取り消しました'
    else
      redirect_to farm_path(params[:farm_id]), denger: 'いいねの取り消しに失敗しました'
    end
  end

  private

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

end
