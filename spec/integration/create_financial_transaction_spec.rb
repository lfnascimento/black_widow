require 'swagger_helper'

describe 'Creating Financial Transaction', type: :request do
  let(:another_user) { create(:user, email: 'zar@mail.com') }
  let(:source_account) { create(:account, user: user) }
  let(:destination_account) { create(:account, user: another_user) }
  let(:user) { create(:user) }

  path '/v1/accounts/{id}/transfer' do
    parameter name: :id, in: :path, type: :string
    let(:id) { source_account.id }
    post 'Create Financial Transaction' do
      tags 'Account'
      security [ bearer: [] ]
      consumes 'application/json'
      parameter name: :financial_transaction, required: true, in: :body, schema: {
        type: :object,
        properties: {
          destination_account_id: { type: :string },
          amount: { type: :string, pattern: '^\d+,\d{2}$' }
        },
        required: [ 'amount', 'destination_account_id' ]
      }

      response '201', 'financial transaction created' do
        let(:Authorization) do
          "Bearer #{Knock::AuthToken.new(payload: { sub: user.id }).token}"
        end
        let(:financial_transaction) do
          { financial_transaction: { destination_account_id: destination_account.id, amount: '10,00' } }
        end
        run_test!
      end

      response '422', 'user not found' do
        let(:Authorization) do
          "Bearer #{Knock::AuthToken.new(payload: { sub: user.id }).token}"
        end
        let(:financial_transaction) do
          { financial_transaction: { destination_account_id: destination_account.id, amount: '200,00' } }
        end
        run_test!
      end
    end
  end
end
