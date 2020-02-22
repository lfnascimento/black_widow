class SerializableAccount < JSONAPI::Serializable::Resource
  include ActionView::Helpers::NumberHelper

  type :accounts

  attribute :identification

  attribute :balance do
    number_to_currency(@object.balance)
  end
end
