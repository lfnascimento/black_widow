require 'rails_helper'

describe FinancialTransaction, type: :model do
  describe 'attributes' do
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:source_account).class_name('Account').autosave(true) }
    it { is_expected.to belong_to(:destination_account).class_name('Account').autosave(true) }
  end

  context 'validations' do
    context 'when source account eq to destination account' do
      let!(:account) { create(:account) }
      subject { described_class.create(source_account: account, destination_account: account, amount: '10.00') }

      it 'should be invalid' do
        expect(subject.errors[:base]).
          to include I18n.t('activerecord.errors.models.financial_transaction.attributes.base.source_account_eq_destination_account')
      end
    end
  end
end
