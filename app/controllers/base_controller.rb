class BaseController < ApplicationController
  before_action :verify_user_signed_in

  def verify_user_signed_in
    unless valid_session
      session[:back] = request.original_url
      redirect_to login_index_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id])
  end

  private

  def valid_session
    session_exists = session[:current_user_id] && User.exists?(session[:current_user_id])
    session_exists || cookies_valid?
  end

  def cookies_valid?
    valid = false

    if cookies.signed[:user_id]
      user = User.find_by_id(cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        valid = true
      end
    end

    logger.info "Cookies Valid for #{cookies.signed[:user_id]}? #{valid}"
    valid
  end

  def log_in(user)
    logger.info "Logging in user #{user.id}"
    session[:current_user_id] = user.id
    @current_user = user
  end
end