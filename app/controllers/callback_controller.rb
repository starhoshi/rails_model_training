class CallbackController < ApplicationController
  def create
    p request.env['omniauth.auth']
    if SocialProfile.exists?(provider: request.env['omniauth.auth'].provider, uid: request.env['omniauth.auth'].uid)
      # return token
      profile = SocialProfile.find_or_create_from_twitter_auth(request.env['omniauth.auth'])
      # user = User.find_or_create_from_token(nil)
      user = User.find(profile.user_id)
    else
      profile = SocialProfile.find_or_create_from_twitter_auth(request.env['omniauth.auth'])
      user = User.find_or_create_from_token(nil)
      profile.update!(user_id: user.id) if profile.user != user
    end
    # user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    # session[:user_id] = user.id
    redirect_to "musiced://callback?token=#{user.auth_token}"
  end

  def destroy
    # reset_session
    # redirect_to root_path
  end
end
