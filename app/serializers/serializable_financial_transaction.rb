class SerializableFinancialTransaction < JSONAPI::Serializable::Resource
  include ActionView::Helpers::NumberHelper

  type :financial_transactions

  attributes :source_account_id, :destination_account_id, :created_at

  attribute :amount do
    number_to_currency(@object.amount)
  end
end
