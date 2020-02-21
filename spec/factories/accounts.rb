FactoryBot.define do
  factory :account do
    identification { 'Foo' }
    balance { '120.75' }
    user
  end
end
