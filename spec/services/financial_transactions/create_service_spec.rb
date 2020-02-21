require 'rails_helper'

describe FinancialTransactions::CreateService, type: :service do
  let(:user) { create(:user) }
  let(:source_account) { create(:account, balance: '100.00', user: user) }
  let(:destination_account) { create(:account, balance: '100.00', user: user) }
  subject { described_class.new(source_account, destination_account, amount) }

  describe '#perform' do
    context 'when valid' do
      let(:amount) { '10,00' }

      it 'should create a financial transaction and update account balances' do
        expect do
          subject.perform
          source_account.reload
          destination_account.reload
        end.to change(FinancialTransaction, :count).by(1).
        and change(source_account, :balance).from(BigDecimal('100.00')).to(BigDecimal('90.00')).
        and change(destination_account, :balance).from(BigDecimal('100.00')).to(BigDecimal('110.00'))
      end
    end

    context 'when invalid' do
      let(:amount) { '150,00' }

      it 'should not create a financial transaction' do
        expect { subject.perform }.to_not change(FinancialTransaction, :count)
      end

      it 'should return a invalid financial transaction' do
        expect(subject.perform.errors['source_account.balance']).
          to include I18n.t('errors.messages.greater_than_or_equal_to', count: 0)
      end

      it 'should not update source account balance' do
        expect do
          subject.perform
          source_account.reload
        end.to_not change(source_account, :balance)
      end

      it 'should not update destination account balance' do
        expect do
          subject.perform
          destination_account.reload
        end.to_not change(destination_account, :balance)
      end
    end
  end
end
