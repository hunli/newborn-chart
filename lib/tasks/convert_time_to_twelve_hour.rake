namespace :onetime do
  desc "Converts from twenty four hour format to twelve hour"
  task convert_time_to_twelve_hour: :environment do
    puts "Running onetime:convert_time_to_twelve_hour" 

    Pump.all.each do |p|
      puts "Running for Pump #{p.id}"
      next unless p.pump_time
      hour = p.pump_time.split(':')[0].to_i
      if hour > 12
        p.pump_time = (hour - 12) + ':' + p.pump_time.split(':')[1]
      elsif hour == 0
        p.pump_time = '12:' + p.pump_time.split(':')[1]
      else
        next
      end

      p.save
    end

    Feed.all.each do |p|
      puts "Running for Feed #{p.id}"
      next unless p.feed_time
      hour = p.pump_time.split(':')[0].to_i
      if hour > 12
        p.feed_time = (hour - 12) + ':' + p.feed_time.split(':')[1]
      elsif hour == 0
        p.feed_time = '12:' + p.feed_time.split(':')[1]
      else
        next
      end

      p.save
    end

    DiaperChange.all.each do |p|
      puts "Running for DiaperChange #{p.id}"
      next unless p.change_time
      hour = p.pump_time.split(':')[0].to_i
      if hour > 12
        p.change_time = (hour - 12) + ':' + p.change_time.split(':')[1]
      elsif hour == 0
        p.change_time = '12:' + p.change_time.split(':')[1]
      else
        next
      end

      p.save
    end
  end
end
