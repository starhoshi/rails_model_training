if @first.blank?
  json.details []
  json.first nil
  json.max_play_date nil
  json.total_play_count 0
  json.total_skip_count 0
  json.duration 0
else
  today = Date.today
  duration = @details.count

  json.song(@song_total_count.song, :id, :title, :artist)
  json.duration duration
  json.first @first
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
