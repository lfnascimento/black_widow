require 'swagger_helper'

describe 'Show Account', type: :request do
  let(:user) { create(:user) }
  let(:user) { create(:user) }
  let(:account_1) { create(:account, user: user) }
  let(:account_2) { create(:account, user: user) }

  path '/v1/accounts/{id}' do
    parameter name: :id, in: :path, type: :string
    get 'Show Account' do
      tags 'Account'
      security [bearer: []]
      consumes 'application/json'

      response '200', 'account info obtained' do
        let(:id) { account_1.id }
        let!(:ft_1) do
          create(:financial_transaction, source_account: account_1,
                 destination_account: account_2,
                 amount: 5.78)
        end

        let!(:ft_2) do
          create(:financial_transaction, source_account: account_2,
                 destination_account: account_1,
                 amount: 5.78)
        end

        let(:Authorization) do
          "Bearer #{Knock::AuthToken.new(payload: { sub: user.id }).token}"
        end
        run_test!
      end
    end
  end
end
