class CreatePumps < ActiveRecord::Migration[5.2]
  def change
    create_table :pumps do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
