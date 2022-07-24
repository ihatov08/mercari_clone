class StripePayment < ApplicationRecord
  belongs_to :stripe_customer

  has_one :current_stripe_payment, dependent: :destroy

  validates :payment_id, presence: true
  validates :brand, presence: true
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :last4, presence: true

  def expired?
    Date
      .new(exp_year, exp_month)
      .end_of_month
      .past?
  end
end
