class BaseController < ApplicationController
  before_action :verify_user_signed_in

  def verify_user_signed_in
    redirect_to login_index_path unless valid_session
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id])
  end

  private

  def valid_session
    session[:current_user_id] && User.exists?(session[:current_user_id])
  end
end