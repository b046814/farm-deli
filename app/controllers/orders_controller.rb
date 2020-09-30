class OrdersController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :authenticate_user!
  
  def new
    if params[:count].to_i == 0 || params[:count] == ""
      redirect_to item_path(@item)
    else
      @order_address = OrderAddress.new
      @order_address.item_id = @item.id 
      @order_address.item_count = params[:count]
      @order_address.amount = (@item.price * params[:count].to_i)
    end
  end

  def create
    @order_address = OrderAddress.new(order_params[:order_address])
    @order_address.user_id = order_params[:user_id]
    @order_address.token = order_params[:token]
    if @order_address.valid?
      payment
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:token, order_address: [:item_id, :item_count, :postal_code, :prefecture_id, :city, :block_number, :building, :phone_number, :amount]).merge(user_id: current_user.id)
  end

  def payment
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:order_address][:amount],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
