class CreateStripePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_payments do |t|
      t.references :stripe_customer, null: false, foreign_key: true
      t.string :payment_id, null: false
      t.string :brand, null: false
      t.integer :exp_month, null: false
      t.integer :exp_year, null: false
      t.string :last4, null: false

      t.timestamps
    end
  end
end
