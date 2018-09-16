class User < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_secure_password

  # Constants
  LIMIT = 50

  def pumps
    Pump.find(account.pump_ids.last(LIMIT))
  end

  def feeds
    Feed.find(account.feed_ids.last(LIMIT))
  end

  def diaper_changes
    DiaperChange.find(account.diaper_change_ids.last(LIMIT))
  end
end
