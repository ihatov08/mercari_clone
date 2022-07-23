class CreateStripeCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_customers do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :customer_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
