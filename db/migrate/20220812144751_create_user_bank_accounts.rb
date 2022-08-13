class CreateUserBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :kind, null: false
      t.string :branch_name, null: false
      t.string :account_number, null: false
      t.string :account_name, null: false

      t.timestamps
    end
  end
end
