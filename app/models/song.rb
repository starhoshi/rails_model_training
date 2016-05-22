class Song < ApplicationRecord
  has_many :playlist_songs
  has_many :song_day_counts
  has_many :song_total_counts

  def self.find_or_create_from_song(title, artist)
    self.find_or_create_by(title: title, artist: artist) do |song|
      song.title = title
      song.artist = artist
    end
  end
end
