class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.citext :name
      t.money :initial_balance, default: 0
      t.money :balance, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
