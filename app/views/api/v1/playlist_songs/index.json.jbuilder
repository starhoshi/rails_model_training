json.array!(@playlist_songs) do |playlist_song|
  json.extract! playlist_song, :id, :playlist_id, :song_id
end
