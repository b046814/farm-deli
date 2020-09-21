class ItemsController < ApplicationController
  before_action :authenticate_farmer!, only: :new

  def index
    @farms = Farm.includes(:farmer)
    @items = Item.all
    @tags = Tag.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :ship_expense_id, :prefecture_id, :period_id, :price, :image).merge(farmer_id: current_farmer.id)
  end

end
