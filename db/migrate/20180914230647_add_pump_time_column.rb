class AddPumpTimeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :pumps, :pump_time, :time
  end
end
