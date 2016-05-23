total_play_count = 0
total_skip_count = 0
json.songs @songs do |song|
  json.song do
    json.(song, :id, :title, :artist)
  end
  json.play_count song.play_count
  json.skip_count song.skip_count
  total_play_count += song.play_count
  total_skip_count += song.skip_count
end

json.total_play_count total_play_count
json.total_skip_count total_skip_count
