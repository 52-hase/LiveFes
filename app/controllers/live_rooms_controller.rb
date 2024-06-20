class LiveRoomsController < ApplicationController
  def index
    @live_rooms = LiveRoom.all
  end
  
  def show
    @live_room = LiveRoom.find(params[:id])
    @messages = @live_room.messages
  end
  
  def create
    @live_room = LiveRoom.new(live_room_params)
    if @live_room.save
      redirect_to @live_room
    else
      render :new
    end
  end

  private

  def live_room_params
    params.require(:live_room).permit(:name)
  end
end
