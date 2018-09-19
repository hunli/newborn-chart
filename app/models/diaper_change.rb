class DiaperChange < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :change_time, presence: true
end
