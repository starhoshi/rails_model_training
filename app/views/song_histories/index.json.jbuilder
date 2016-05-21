# json.array!(@song_histories) do |song_history|
#   json.extract! song_history, :id, :user_id, :song_id, :device_id, :media_id, :track_source, :album, :duration, :genre, :album_art_uri, :track_number, :num_tracks, :recorded_at, :point, :accuracy, :altitude, :record_type
#   json.url song_history_url(song_history, format: :json)
# end

if @first.blank?
  json.details []
  json.first nil
  json.max_play_date nil
  json.total_play_count 0
  json.total_skip_count 0
  json.duration 0
else
  duration = @details.count
  today = Date.today

  json.first @first
  json.duration duration
  json.total_play_count @song_total_count.play_count
  json.total_skip_count @song_total_count.skip_count
  json.details @details.each_with_index.to_a do |details, index|
    if details.nil?
      json.play_count 0
      json.skip_count 0
      json.date today - (duration - index - 1)
    else
      json.(details, :play_count, :skip_count, :date)
    end
  end
end
