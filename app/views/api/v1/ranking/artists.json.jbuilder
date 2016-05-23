json.artist_count @artists.length
json.artists @artists do |artist|
  json.play_count artist.play_count
  json.skip_count artist.skip_count
  json.artist artist.artist
end
