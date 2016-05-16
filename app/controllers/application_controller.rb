class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['Authorization'] = 'Bearer realm="Application"'
    render json: {:message => "Unauthorized"}, status: 401
  end
end
