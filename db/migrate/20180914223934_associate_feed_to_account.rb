class AssociateFeedToAccount < ActiveRecord::Migration[5.2]
  def change
    add_reference :feeds, :account
  end
end
