require 'swagger_helper'

describe 'User authentication API', type: :request do
  let(:user) { create(:user) }

  path '/v1/user_token' do
    post 'Obtain user token' do
      tags 'User Authentication'
      consumes 'application/json'
      parameter name: :auth, required: true, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '201', 'user token obtained' do
        schema type: :object,
               properties: {
                 jwt: { type: :string, },
               },
               required: ['jwt']

        let(:auth) { { auth: { email: user.email, password: user.password } } }
        run_test!
      end

      response '404', 'user not found' do
        let(:auth) { { auth: { email: user.email, password: 'bar' } } }
        run_test!
      end
    end
  end
end
