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

  def show
    @farm = Farm.find(params[:id])
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    farm = Farm.find(params[:id])
    if params[:farm][:image_ids]
      params[:farm][:image_ids].each do |image_id|
        image = post.images.find(image_id)
        image.purge
      end
    end
    if farm.update(farms_params)
      redirect_to farm_path(farm.id)
    else
      render :edit
    end
  end

  private

  def farms_params
    params.require(:farm).permit(:name, :prefecture_id, :description, :feature, images: []).merge(farmer_id: current_farmer.id)
  end

end
