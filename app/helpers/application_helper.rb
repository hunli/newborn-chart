module ApplicationHelper
  def current_user
    @user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end

  def get_time
    Time.now.strftime("%H:%M")
    tfhour = Time.now.hour
    hour = case tfhour.to_i
    when 0
      '12'
    when 1..12
      tfhour
    when 13..24
      "#{tfhour.to_i - 12}"
    end

    min = Time.now.min
    "#{hour}:#{min}"
  end

  def get_cycle
    Time.now.hour >=12 ? 'PM' : 'AM'
  end
end
