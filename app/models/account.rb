class Account < ApplicationRecord
  # Associations
  has_many :users
  has_many :pumps
  has_many :feeds
  has_many :diaper_changes

  # Callbacks
  before_create :generate_token
  before_destroy :destroy_children

  # Before Create
  def generate_token
    # 65 is the value of 'A', while 65 + 57 is the value of 'z'
    self.token = (0..8).map { (65 + rand(58)).chr }.join
  end

  # Before Destroy
  def destroy_children
    self.users.destroy_all
    self.pumps.destroy_all
    self.feeds.destroy_all
    self.diaper_changes.destroy_all
  end
end
