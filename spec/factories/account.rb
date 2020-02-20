FactoryBot.define do
  factory :account do
    name { 'Foo' }
    initial_balance { '120.75' }
    balance { '120.75' }
    user
  end
end
