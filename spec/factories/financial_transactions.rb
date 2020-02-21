FactoryBot.define do
  factory :financial_transaction do
    amount { "99.45" }
    source_account { nil }
    destination_account { nil }
  end
end
