class Song < ApplicationRecord
  def self.find_or_create_from_song(title, artist)
    self.find_or_create_by(title: title, artist: artist) do |song|
      song.title = title
      song.artist = artist
    end
  end
end
