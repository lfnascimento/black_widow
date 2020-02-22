class SerializableAccount < JSONAPI::Serializable::Resource
  include ActionView::Helpers::NumberHelper

  type :accounts

  attribute :identification

  attribute :balance do
    number_to_currency(@object.balance)
  end

  has_many :credits do
    data do
      @object.credits
    end
  end
  has_many :debits do
    data do
      @object.debits
    end
  end
end
