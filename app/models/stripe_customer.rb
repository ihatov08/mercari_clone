class StripeCustomer < ApplicationRecord
  belongs_to :user

  validates :stripe_customer_id, presence: true
  validates :stripe_customer_id, uniqueness: true
end
