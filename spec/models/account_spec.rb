require 'rails_helper'

describe Account, type: :model do
  describe 'attributes' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:initial_balance).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    context 'when creating account' do
      context 'with initial balance different from balance' do
        it 'shoud be invalid' do
          account = Account.create(name: 'Foo', initial_balance: '10.25', balance: '5.12')
          expect(account.errors[:base]).
            to include I18n.t('activerecord.errors.models.account.attributes.base.initial_balance_not_eq_balance')
        end
      end
    end
  end
end
