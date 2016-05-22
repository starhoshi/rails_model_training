class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  validates :name, presence: true, uniqueness: {scope: [:user_id]}

  def self.create_by_params(params, user_id)
    playlist = Playlist.new do |pl|
      pl.user_id = user_id
      pl.name = params[:name]
      pl.active = true
    end
  end
end
