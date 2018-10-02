class User < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_secure_password

  # Constants
  LIMIT = 20

  # Accessors
  attr_accessor :remember_token

  def pumps
    Pump.find(account.pump_ids.last(LIMIT))
  end

  def feeds
    Feed.find(account.feed_ids.last(LIMIT))
  end

  def diaper_changes
    DiaperChange.find(account.diaper_change_ids.last(LIMIT))
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def self.digest(string)
    BCrypt::Password.create(string, cost: BCrypt::Engine::MIN_COST)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end
end
