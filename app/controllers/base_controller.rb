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
    session[:current_user_id] && User.exists?(session[:current_user_id])
  end
end