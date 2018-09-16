class AddDiaperChangeTimeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :diaper_changes, :change_time, :time
  end
end
