class AddFeedTimeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :feed_time, :time
  end
end
