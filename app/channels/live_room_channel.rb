class LiveRoomChannel < ApplicationCable::Channel
  def subscribed
    live_room = LiveRoom.find(params[:live_room_id])
    stream_for live_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    live_room = LiveRoom.find_by(id: data['live_room_id'])
    message = live_room.messages.create!(content: data['message'])
    template = ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    LiveRoomChannel.broadcast_to(live_room, template)  # 特定のライブルームにブロードキャスト
  end
end
