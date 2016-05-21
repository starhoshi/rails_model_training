json.array!(@songs) do |song|
  json.song do
    json.(song, :id, :title, :artist)
  end
  json.play_count song.play_count
  json.skip_count song.skip_count
end
