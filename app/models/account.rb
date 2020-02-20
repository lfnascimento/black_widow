class Account < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :initial_balance, :balance, numericality: { greater_than_or_equal_to: 0 }
  validate :initial_balance_eq_balance, on: :create

  private

  def initial_balance_eq_balance
    errors.add(:base, :initial_balance_not_eq_balance) if initial_balance != balance
  end
end
