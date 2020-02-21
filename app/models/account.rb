class Account < ApplicationRecord
  belongs_to :user

  validates :identification, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
