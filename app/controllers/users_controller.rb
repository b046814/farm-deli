class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @orders = @user.orders.includes(:item)
  end
end
