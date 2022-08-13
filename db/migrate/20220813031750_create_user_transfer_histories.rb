class CreateUserTransferHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_transfer_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :bank_account_name
      t.integer :kind
      t.string :bank_account_branch_name
      t.string :bank_account_number

      t.timestamps
    end
  end
end
