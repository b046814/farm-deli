class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    @order_address.item_id = @item.id 
    @order_address.item_count = params[:count]
    @order_address.amount = (@item.price * params[:count].to_i)
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @order_address.token = params[:token]
    if @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:item_id, :item_count, :postal_code, :prefecture_id, :city, :block_number, :building, :phone_number).merge(user_id: current_user.id)
  end

end
