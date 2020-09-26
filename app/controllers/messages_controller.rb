class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @room = @message.room
    if user_signed_in?
      @message.id_user = true
    else
      @message.id_user = false
    end

    if @message.save
      redirect_to room_path(@room)
    else
      redirect_to room_path(@room)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(room_id: params[:room_id])
  end

end
