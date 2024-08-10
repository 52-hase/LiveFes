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
    
    # データベースに曲が存在しない場合の処理
    if @music.nil?
      Rails.logger.info "Music not found in database for ID: #{params[:id]}"
      begin
        # Spotify APIを使用して曲情報を取得、ライブイベントが指定されている場合は取得、新しい曲レコードを作成
        @track = RSpotify::Track.find(params[:id])
        if @track && @track.artists.map(&:name).include?(@artist.name)
          live_event = LiveEvent.find(params[:live_event_id]) if params[:live_event_id]
          @music = Music.new(
            spotify_track_id: @track.id,
            name: @track.name,
            artist_name: @track.artists.first.name,
            artist: @artist,
            live_event: live_event
          )
          
          if @music.save
            Rails.logger.info "Created new music entry: #{@music.inspect}"
          else
            Rails.logger.error "Failed to save music: #{@music.errors.full_messages.join(', ')}"
          end
        else
          Rails.logger.info "Track not found in Spotify for ID: #{params[:id]} or does not match artist"
        end
      rescue => e
        Rails.logger.error "Spotify API error: #{e.message}"
      end
    end
    
    # 曲が見つかった場合、showビューを表示、見つからなかった場合、アーティストの曲一覧にリダイレクト
    if @music
      render :show
    else
      redirect_to artist_musics_path(@artist), alert: "Music with ID #{params[:id]} not found"
    end
  end
  
  private
  
end