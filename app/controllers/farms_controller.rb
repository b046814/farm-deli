class FarmsController < ApplicationController
  def new
    @farm = Farm.new 
  end

  def create
    @farm = Farm.new(farms_params)
    if @farm.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def farms_params
    params.require(:farm).permit(:name, :prefecture_id, :description, :feature, images: []).merge(farmer_id: current_farmer.id)
  end

end
