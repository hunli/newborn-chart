module UserHelper
  def user_name
    current_user&.name
  end
end
