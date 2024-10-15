class MusicsController < ApplicationController
  # アーティストを取得、ライブイベントが指定されている場合は取得
  def index
    @artist = Artist.find(params[:artist_id])
    @live_event = LiveEvent.find(params[:live_event_id]) if params[:live_event_id].present?

    # 特定のライブイベントに関連する曲のみを取得、ライブイベントが指定されていない場合は、アーティストの全ての曲を取得
    if @live_event
      @musics = @artist.musics.where(live_event_id: @live_event.id)
    else
      @musics = @artist.musics
    end

    # 曲の情報を整形
    @musics = @musics.map do |music|
      {
        name: music.name,
        artist: music.artist_name,
        id: music.spotify_track_id,
        live_event_id: music.live_event_id
      }
    end
  end

  # アーティストを取得、Spotify track IDで曲を検索
  def show
    @artist = Artist.find(params[:artist_id])
    @music = Music.find_by(spotify_track_id: params[:id])
  end
end
