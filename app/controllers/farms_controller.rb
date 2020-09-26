class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_farmer!, only: :new
  before_action :move_to_root, only: [:edit, :destroy]

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farms_params)
    if params[:farm][:text]
    tag_list = params[:farm][:text].split(",")
    end
    if @farm.save
      @farm.save_tag(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @farm_tags = @farm.tags
    @farmer = @farm.farmer
    @room = Room.new
  end

  def edit
    @tag_list = @farm.tags.pluck(:text).join(",")
  end

  def update
    if params[:farm][:image_ids]
      params[:farm][:image_ids].each do |image_id|
        image = @farm.images.find(image_id)
        image.purge
      end
    end
    if farms_params[:images]
      @farm.images.attach(farms_params[:images])
    end
    if params[:farm][:text]
    tag_list = params[:farm][:text].split(",")
    end
    if @farm.update(name: farms_params[:name], prefecture_id: farms_params[:prefecture_id], description: farms_params[:description], feature: farms_params[:feature], farmer_id: farms_params[:farmer_id])
      @farm.save_tag(tag_list)  
      redirect_to farm_path(@farm.id)
    else
      render :edit
    end
  end

  def destroy
    if @farm.destroy
      redirect_to root_path
    else
      redirect_to farm_path(@farm)
    end
  end

  private

  def farms_params
    params.require(:farm).permit(:name, :prefecture_id, :description, :feature, images: []).merge(farmer_id: current_farmer.id)
  end

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def move_to_root
    return if farmer_signed_in? && current_farmer.id == @farm.farmer_id

    redirect_to root_path
  end
end
