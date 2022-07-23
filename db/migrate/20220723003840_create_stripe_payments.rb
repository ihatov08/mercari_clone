class CreateStripePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_payments do |t|
      t.references :stripe_customer, null: false, foreign_key: true
      t.string :payment_id
      t.string :brand
      t.integer :exp_month
      t.integer :exp_year
      t.string :last4

      t.timestamps
    end
  end
end
