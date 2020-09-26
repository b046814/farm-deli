class RoomsController < ApplicationController
  
  def index
    if user_signed_in?
      @user = current_user
      @rooms = @user.rooms
    end
    if farmer_signed_in?
      @farmer = current_farmer
      @rooms = @farmer.rooms
    end
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def room_params
    params.permit(:farmer_id).merge(user_id: current_user.id)
  end
end
