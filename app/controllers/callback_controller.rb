class CallbackController < ApplicationController
  def create
    p request.env['omniauth.auth']
    if SocialProfile.exists?(provider: request.env['omniauth.auth'].provider, uid: request.env['omniauth.auth'].uid)
      profile = SocialProfile.find_or_create_from_twitter_auth(request.env['omniauth.auth'])
      user = User.find(profile.user_id)
    else
      profile = SocialProfile.find_or_create_from_twitter_auth(request.env['omniauth.auth'])
      user = User.find_or_create_from_token(nil)
      profile.update!(user_id: user.id) if profile.user != user
    end
    redirect_to "musiced://callback?token=#{user.auth_token}"
  end
end
