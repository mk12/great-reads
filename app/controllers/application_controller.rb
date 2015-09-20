class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    render_404 unless current_user
  end

  private

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
