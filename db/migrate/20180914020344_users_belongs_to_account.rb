class UsersBelongsToAccount < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :account, index: true
  end
end
