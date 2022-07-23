class StripePayment < ApplicationRecord
  belongs_to :stripe_customer
end
