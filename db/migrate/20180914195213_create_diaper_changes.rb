class CreateDiaperChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :diaper_changes do |t|
      t.string :diaper_type

      t.timestamps
    end
  end
end
