require 'rails_helper'

describe Account, type: :model do
  describe 'attributes' do
    it { is_expected.to validate_presence_of(:identification) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it do
      is_expected.to have_many(:debits).
        class_name('FinancialTransaction').
        with_foreign_key(:source_account_id).
        dependent(:restrict_with_exception)
    end
    it do
      is_expected.to have_many(:credits).
        class_name('FinancialTransaction').
        with_foreign_key(:destination_account_id).
        dependent(:restrict_with_exception)
    end
  end
end
