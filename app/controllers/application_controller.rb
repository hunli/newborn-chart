class ApplicationController < ActionController::Base
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    logger.info "Saving Cookies for user #{cookies.signed[:user_id]}: with token #{cookies[:remember_token]}"
  end
end
