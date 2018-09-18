class ChangeDiaperChangeTimeToString < ActiveRecord::Migration[5.2]
  def up
    add_column :diaper_changes, :change_time_s, :string

    DiaperChange.all.each do |p|
      next unless p.change_time
      time  = p.change_time.to_s.split[1][0..4]
      cycle = if time.split(':').first.to_i >=12
        'PM'
      else
        'AM'
      end

      p.change_time_s = p.change_time.to_s.split[1][0..4] << " #{cycle}"
      p.save
    end

    remove_column :diaper_changes, :change_time
    rename_column :diaper_changes, :change_time_s, :change_time
  end

  def down
    remove_column :diaper_changes, :change_time
    add_column :diaper_changes, :change_time, :time
  end
end
