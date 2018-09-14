class Account < ApplicationRecord
  # Associations
  has_many :users

  # Callbacks
  before_create :generate_token

  # Before Create
  def generate_token
    # 65 is the value of 'A', while 65 + 57 is the value of 'z'
    self.token = (0..8).map { (65 + rand(58)).chr }.join
  end
end
