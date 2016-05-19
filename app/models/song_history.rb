class SongHistory < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :device

  def self.create_by_params(params, user_id, device_id, song_id)
    song_history = SongHistory.new do |s|
      s.device_id = device_id
      s.user_id = user_id
      s.song_id = song_id
      s.media_id = params[:media_id]
      s.track_source = params[:track_source]
      s.duration = params[:duration]
      s.genre = params[:genre]
      s.album_art_uri = params[:album_art_uri]
      s.track_number = params[:track_number]
      s.num_tracks = params[:num_tracks]
      s.latitude = params[:latitude]
      s.longitude = params[:longitude]
      s.accuracy = params[:accuracy]
      s.altitude = params[:altitude]
      s.record_type = params[:record_type]
      s.album = params[:album]
      s.recorded_at = params[:recorded_at]
    end
  end
end
