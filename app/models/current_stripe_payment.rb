class CurrentStripePayment < ApplicationRecord
  belongs_to :stripe_customer
  belongs_to :stripe_payment

  validates :stripe_customer_id, uniqueness: true
end
