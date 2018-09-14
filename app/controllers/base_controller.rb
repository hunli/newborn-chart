class BaseController < ApplicationController
  before_action :verify_user_signed_in

  def verify_user_signed_in
    # TODO: Should actually redirect to a log in page when log in page is created
    redirect_to welcome_index_path unless session[:current_user_id]
  end

  def current_user
    current_user = User.find_by_id(session[:current_user_id])
  end
end