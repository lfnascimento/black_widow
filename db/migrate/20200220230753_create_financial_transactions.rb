class CreateFinancialTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_transactions, id: :uuid do |t|
      t.money :amount, default: 0
      t.references :source_account, null: false, type: :uuid, index: true, foreign_key: { to_table: :accounts }
      t.references :destination_account, null: false, type: :uuid, index: true, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
