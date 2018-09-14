module ApplicationHelper
  def current_user
    @user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end
end
