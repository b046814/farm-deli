class ItemsController < ApplicationController
  before_action :authenticate_farmer!, only: :new
  before_action :set_item, only: [:show, :edit, :update]


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

  def search
    @items = Item.search(params[:keyword])
  end

  def show
  end

  def edit
  end

  def update
    if item.save
      redirect_to item_path(item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :ship_expense_id, :prefecture_id, :period_id, :price, :image).merge(farmer_id: current_farmer.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
