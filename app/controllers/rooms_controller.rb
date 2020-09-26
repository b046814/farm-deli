class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :destroy]
  
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
    @user = @room.user
    @farmer = @room.farmer
    @message = Message.new
    @messages = @room.messages
  end

  def destroy
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

  def set_room
    @room = Room.find(params[:id])
  end

end
