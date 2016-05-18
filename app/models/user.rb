class User < ApplicationRecord
  has_many :devices
  has_many :social_profiles

  def self.find_or_create_from_token(token)
    self.find_or_create_by(auth_token: token) do |user|
      user.auth_token = SecureRandom.hex(64)
    end
  end

end
