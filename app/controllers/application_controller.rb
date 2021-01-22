class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # rubocop:disable Style/DoubleNegation
  def logged_in?
    !!current_user
  end
  # rubocop:enable Style/DoubleNegation

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action'
    redirect_to login_path
  end

  def check_signed_in
    redirect_to users_path(current_user)if logged_in?
  end
end
