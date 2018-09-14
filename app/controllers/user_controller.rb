class UserController < BaseController
  def index
    @user = current_user
  end
end
