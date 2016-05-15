class SocialProfile < ApplicationRecord
  belongs_to :user

  def self.find_or_create_from_twitter_auth(auth)
    self.find_or_create_by(provider: auth.provider, uid: auth.uid) do |social_profile|
      social_profile.provider = auth.provider
      social_profile.uid = auth.uid
      social_profile.name = auth.info.name
      social_profile.nickname = auth.info.nickname
      social_profile.email = User.dummy_email(auth)
      social_profile.url = auth.info.urls.Twitter
      social_profile.image_url = auth.info.image
      social_profile.description = auth.info.description.try(:truncate, 255)
      social_profile.credentials = auth.info.credentials
      social_profile.raw_info = auth.info
    end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
