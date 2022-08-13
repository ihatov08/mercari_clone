class CreateUserTransferHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_transfer_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :bank_name, null: false
      t.string :bank_account_name, null: false
      t.integer :bank_account_kind, null: false
      t.string :bank_account_branch_name, null: false
      t.string :bank_account_number, null: false

      t.timestamps
    end
  end
end
