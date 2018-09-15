class ChangeFeedAmountToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :feeds, :amount, :float
  end
end
