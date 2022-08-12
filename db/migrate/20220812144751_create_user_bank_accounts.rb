class CreateUserBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :kind
      t.string :branch_name
      t.string :account_number
      t.string :account_name

      t.timestamps
    end
  end
end
