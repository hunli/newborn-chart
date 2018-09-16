class AssociateDiaperChangeToAccount < ActiveRecord::Migration[5.2]
  def change
    add_reference :diaper_changes, :account
  end
end
