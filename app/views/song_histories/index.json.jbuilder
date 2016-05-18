json.array!(@song_histories) do |song_history|
  json.extract! song_history, :id, :user_id, :song_id, :device_id, :media_id, :track_source, :album, :duration, :genre, :album_art_uri, :track_number, :num_tracks, :recorded_at, :point, :accuracy, :altitude, :record_type
  json.url song_history_url(song_history, format: :json)
end
