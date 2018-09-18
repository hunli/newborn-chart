class ChangePumpTimeToString < ActiveRecord::Migration[5.2]
  def up
    add_column :pumps, :pump_time_s, :string

    Pump.all.each do |p|
      next unless p.pump_time
      time  = p.pump_time.to_s.split[1][0..4]
      cycle = if time.split(':').first.to_i >=12
        'PM'
      else
        'AM'
      end

      p.pump_time_s = p.pump_time.to_s.split[1][0..4] << " #{cycle}"
      p.save
    end

    remove_column :pumps, :pump_time
    rename_column :pumps, :pump_time_s, :pump_time
  end

  def down
    remove_column :pumps, :pump_time
    add_column :pumps, :pump_time, :time
  end
end
