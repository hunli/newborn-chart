class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def signin
    user = User.find_by_email(email)

    if user.authenticate(password)
      session[:current_user_id] = user.id
      remember user
      redirect_successfully
    else
      flash.now.alert = "Invalid email/password"
      # TODO: Need to check if refreshing the page after rendering causes an error
      render :index
    end
  end

  private

  def email
    params[:user][:email]
  end

  def password
    params[:user][:password]
  end

  def redirect_successfully
    if session[:back]
      redirect_to session[:back]
    else
      redirect_to user_index_url
    end
  end
end
