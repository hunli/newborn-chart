class Feed < ApplicationRecord
  # Associations
  belongs_to :account

  #Validations
  validates :amount, presence: true
  validates :feed_time, presence: true
end
