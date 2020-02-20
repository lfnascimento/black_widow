require 'rails_helper'

describe V1::UsersController, type: :controller do
  describe 'GET #show' do
    include_context 'basic user auth setup'

    before { get :show, params: { id: user.id } }

    it { is_expected.to respond_with(:created) }
  end
end
