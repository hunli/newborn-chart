module ApplicationHelper
  def current_user
    @user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end

  def get_time
    time = Time.now.strftime("%H:%M")
    split_time = time.split(':')
    min = split_time[1]
    tfhour = split_time[0]

    hour = case tfhour.to_i
    when 0
      '12'
    when 1..12
      tfhour
    when 13..24
      "#{tfhour.to_i - 12}"
    end

    "#{hour}:#{min}"
  end

  def get_cycle
    Time.now.hour >=12 ? 'PM' : 'AM'
  end
end
