class LiveRoomChannel < ApplicationCable::Channel
  def subscribed
    live_room = LiveRoom.find(params[:live_room_id])
    stream_for live_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data['message'], user_id: data['user_id'], live_room_id: data['live_room_id'])
    template = ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    LiveRoomChannel.broadcast_to(message.live_room, template)  # 特定のライブルームにブロードキャスト
  end
end
