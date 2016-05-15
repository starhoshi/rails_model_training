class User < ApplicationRecord

  def self.find_or_create_from_token(token)
    self.find_or_create_by(token: token) do |user|
      user.token = SecureRandom.hex(64)
    end
  end

end
