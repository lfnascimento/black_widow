require 'swagger_helper'

describe 'Show Account Balance', type: :request do
  let(:user) { create(:user) }
  let(:account_1) { create(:account, user: user) }

  path '/v1/accounts/{id}/balance' do
    parameter name: :id, in: :path, type: :string
    get 'Account Balance' do
      tags 'Account'
      security [bearer: []]
      consumes 'application/json'

      response '200', 'account balance obtained' do
        let(:id) { account_1.id }
        let(:Authorization) do
          "Bearer #{Knock::AuthToken.new(payload: { sub: user.id }).token}"
        end
        run_test!
      end

      response '404', 'account not found' do
        let(:id) { 'foo' }
        let(:Authorization) do
          "Bearer #{Knock::AuthToken.new(payload: { sub: user.id }).token}"
        end
        run_test!
      end
    end
  end
end
