module V1
  class AccountsController < ApplicationController
    before_action :authenticate_user
    before_action :load_account, :load_destination_account, only: [:transfer]

    def transfer
      if financial_transaction.valid?
        render jsonapi: @financial_transaction, status: :created
      else
        render json: @financial_transaction.errors, status: :unprocessable_entity
      end
    end

    private

    def load_destination_account
      @destination_account ||= Account.find(financial_transaction_params[:destination_account_id])
    end

    def load_account
      @account ||= current_user.accounts.find(params[:id])
    end

    def financial_transaction
      @financial_transaction ||= FinancialTransactions::CreateService.
        new(@account,
            @destination_account,
            Monetize.parse(financial_transaction_params[:amount]).to_f).
        perform
    end

    def financial_transaction_params
      params.require(:financial_transaction).permit(:destination_account_id, :amount)
    end
  end
end
