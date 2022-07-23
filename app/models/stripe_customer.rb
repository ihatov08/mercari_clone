class StripeCustomer < ApplicationRecord
  belongs_to :user

  validates :stripe_customer_id, presence: true
  validates :stripe_customer_id, uniqueness: true

  before_validation :create_stripe_customer, if: :new_record?

  private

  def create_stripe_customer
    stripe_customer = Stripe::Customer.create(metadata: { user_id: user.id })

    self.customer_id = stripe_customer.id
  end
end
