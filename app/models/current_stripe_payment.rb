class CurrentStripePayment < ApplicationRecord
  belongs_to :stripe_customer
  belongs_to :stripe_payment
end
