class SongDayCount < ApplicationRecord
  belongs_to :user
  belongs_to :song

  def self.update_or_create_by_song_history(song_history)
    song_day_count = SongDayCount.find_or_initialize_by(
      user_id: song_history.user_id,
      date: song_history.recorded_at.to_s,
      song_id: song_history.song_id
    )
    if song_history.record_type == Constants::RecordType::PLAY
      song_day_count.play_count = song_day_count.play_count.to_i.next
      song_day_count.skip_count = song_day_count.skip_count.to_i
    else
      song_day_count.play_count = song_day_count.play_count.to_i
      song_day_count.skip_count = song_day_count.skip_count.to_i.next
    end
    song_day_count.save
  end

end
