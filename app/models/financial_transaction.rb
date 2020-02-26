class FinancialTransaction < ApplicationRecord
  with_options class_name: 'Account', autosave: true do
    belongs_to :source_account
    belongs_to :destination_account
  end

  validates :amount, numericality: { greater_than: 0 }
  validate :source_account_not_eq_destination_account

  private

  def source_account_not_eq_destination_account
    errors.add(:base, :source_account_eq_destination_account) if source_account == destination_account
  end
end
