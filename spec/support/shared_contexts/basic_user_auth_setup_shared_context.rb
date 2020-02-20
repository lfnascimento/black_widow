RSpec.shared_context 'basic user auth setup' do
  let!(:user) { create(:user) }
  before { authenticated_header(request, user) }
end
