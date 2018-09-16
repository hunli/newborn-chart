
class SignUpController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.account = account
    if @user.save
      flash[:notice] = "User created successfully"
      session[:current_user_id] = @user.id
      redirect_to user_index_url
    else
      flash.now.alert = "User failed to be created"
      # TODO: Refreshing the page after rendering causes an error
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def account
    account_token = params[:account_token]
    Account.find_by_token(account_token) || Account.create
  end
end
