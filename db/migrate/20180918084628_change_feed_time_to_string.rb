class ChangeFeedTimeToString < ActiveRecord::Migration[5.2]
  def up
    add_column :feeds, :feed_time_s, :string

    Feed.all.each do |p|
      next unless p.feed_time
      time  = p.feed_time.to_s.split[1][0..4]
      cycle = if time.split(':').first.to_i >=12
        'PM'
      else
        'AM'
      end

      p.feed_time_s = p.feed_time.to_s.split[1][0..4] << " #{cycle}"
      p.save
    end

    remove_column :feeds, :feed_time
    rename_column :feeds, :feed_time_s, :feed_time
  end

  def down
    remove_column :feeds, :feed_time
    add_column :feeds, :feed_time, :time
  end
end
