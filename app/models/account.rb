class Account < ApplicationRecord
  belongs_to :user

  with_options class_name: 'FinancialTransaction', dependent: :restrict_with_exception do
    has_many :debits, foreign_key: :source_account_id
    has_many :credits, foreign_key: :destination_account_id
  end

  validates :identification, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
