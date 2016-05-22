class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :song

  def self.create_by_params(playlist_id, song_id)
    playlist_song = PlaylistSong.new do |pl_song|
      pl_song.playlist_id = playlist_id
      pl_song.song_id = song_id
      pl_song.active = true
    end
    playlist_song.save
  end
end
