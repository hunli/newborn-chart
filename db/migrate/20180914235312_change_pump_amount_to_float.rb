class ChangePumpAmountToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :pumps, :amount, :float
  end
end
