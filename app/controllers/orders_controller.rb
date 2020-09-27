class OrdersController < ApplicationController

  def new
    @item = Item.find(params[:id])
    @order_address = OrderAdress.new
  end

  def create
    @order_address = OrderAdress.new(order_params)
    if @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, order_address: [:item_count, :postal_code, :prefecture_id, :city, :block_number, :building, :phone_number]).merge(user_id: current_user.id)
  end

end
