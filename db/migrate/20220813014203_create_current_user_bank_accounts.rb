class CreateCurrentUserBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :current_user_bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_bank_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
