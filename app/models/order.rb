class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  enum status: {
    ordered: 10,
    shipped: 20,
    received: 30,
    completed: 40
  }

  validates :status, presence: true
  validates :payment_method_id, presence: true
  validates :payer_family_name, presence: true
  validates :payer_given_name, presence: true
  validates :payer_family_name_kana, presence: true
  validates :payer_given_name_kana, presence: true
  validates :payer_postal_code, presence: true
  validates :payer_prefecture_id, presence: true
  validates :payer_city, presence: true
  validates :payer_line, presence: true
  validates :payer_building_name, presence: true
  validates :payer_phone_number, presence: true

  def pay!
    transaction do
      begin
        check_payment_method_id
        check_shipping_address

        if errors.any?
          raise ActiveRecord::RecordInvalid, self
        end

        self.payment_method_id = payment_method_id

        assign_shipping_address_attributes
        save!
        create_stripe_payment_intent!
      rescue Stripe::CardError => e
        Rails.logger.error "Error is: \#{e.error.code}"
        payment_intent_id = e.error.payment_intent.id
        payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
        Rails.logger.error "Error is: #{e.error.code}, payment_intent_id = #{payment_intent.id}"
        false
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error e
        false
      end
    end
  end

  private

  def payment_method_id
    @payment_method_id ||=
      user
        .stripe_customer
        &.current_stripe_payment
        &.stripe_payment
        &.payment_id
  end

  def shipping_address
    @shipping_address ||=
      user
        &.current_shipping_address
        &.shipping_address
  end

  def check_payment_method_id
    unless payment_method_id
      errors.add(:payment_method_id, "を選択してください")
    end
  end

  def check_shipping_address
    unless shipping_address
      errors.add(:shipping_address, "を選択してください")
    end
  end

  def create_stripe_payment_intent!
    Stripe::PaymentIntent.create({
      amount: item.price,
      currency: 'jpy',
      customer: user.stripe_customer.customer_id,
      payment_method: payment_method_id,
      off_session: true,
      confirm: true,
    })
  end

  def assign_shipping_address_attributes
    assign_attributes(
      payer_family_name: shipping_address.family_name,
      payer_given_name: shipping_address.given_name,
      payer_family_name_kana: shipping_address.family_name_kana,
      payer_given_name_kana: shipping_address.given_name_kana,
      payer_postal_code: shipping_address.postal_code,
      payer_prefecture_id: shipping_address.prefecture_id,
      payer_city: shipping_address.city,
      payer_line: shipping_address.line,
      payer_building_name: shipping_address.building_name,
      payer_phone_number: shipping_address.phone_number,
    )
  end
end
