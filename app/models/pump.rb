class Pump < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :amount, presence: true
  validates :pump_time, presence: true
end
