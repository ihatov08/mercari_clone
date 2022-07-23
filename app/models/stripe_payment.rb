class StripePayment < ApplicationRecord
  belongs_to :stripe_customer

  validates :payment_id, presence: true
  validates :brand, presence: true
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :last4, presence: true
end
