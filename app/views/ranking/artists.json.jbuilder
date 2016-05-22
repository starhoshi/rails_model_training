json.array!(@artists) do |artist|
  json.play_count artist.play_count
  json.skip_count artist.skip_count
  json.artist artist.artist
end
