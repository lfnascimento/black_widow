FactoryBot.define do
  factory :account do
    name { 'Foo' }
    balance { '120.75' }
    user
  end
end
