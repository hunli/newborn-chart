class User < ApplicationRecord
  # Associations
  belongs_to :account

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_secure_password
end
