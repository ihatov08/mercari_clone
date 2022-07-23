class CreateCurrentStripePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :current_stripe_payments do |t|
      t.references :stripe_customer, null: false, foreign_key: true, index: { unique: true }
      t.references :stripe_payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
