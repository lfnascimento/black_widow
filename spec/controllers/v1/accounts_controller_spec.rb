require 'rails_helper'

describe V1::AccountsController, type: :controller do
  describe 'GET #create' do
    include_context 'basic user auth setup'
    let(:source_account) { create(:account, user: user) }
    let(:another_user) { create(:user, email: 'zar@mail.com') }
    let(:destination_account) { create(:account, user: another_user) }

    before { post :transfer, params: params }

    context 'with valid params' do
      let(:params) do
        {
          id: source_account.id,
          financial_transaction: {
            destination_account_id: destination_account.id,
            amount: '100.90'
          }
        }
      end

      it { is_expected.to respond_with(:created) }
    end

    context 'with invalid params' do
      let(:params) do
        {
          id: source_account.id,
          financial_transaction: {
            destination_account_id: destination_account.id,
            amount: '150.00'
          }
        }
      end

      it { is_expected.to respond_with(:unprocessable_entity) }
    end
  end
end
