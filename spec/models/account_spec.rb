require 'rails_helper'

describe Account, type: :model do
  describe 'attributes' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
