module FinancialTransactions
  class CreateService
    attr_reader :source_account, :destination_account, :amount

    def initialize(source_account, destination_account, amount)
      @source_account = source_account
      @destination_account = destination_account
      @amount = amount
    end

    def perform
      financial_transaction.source_account.balance -= amount
      financial_transaction.destination_account.balance += amount
      financial_transaction.tap(&:save)
    end

    private

    def financial_transaction
      @financial_transaction ||= FinancialTransaction.
                                 new(source_account: source_account,
                                     destination_account: destination_account,
                                     amount: amount)
    end
  end
end
