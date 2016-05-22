class User < ApplicationRecord
  has_many :devices
  has_many :social_profiles
  has_many :push_tokens
  has_many :song_histories
  has_many :song_day_counts
  has_many :song_total_counts
  has_many :playlists

  def self.find_or_create_from_token(token)
    self.find_or_create_by(auth_token: token) do |user|
      user.auth_token = SecureRandom.hex(64)
      user.privacy = Constants::Privacy::PRIVATE
    end
  end
end
