class StripePaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
  end

  def new
    @setup_intent =
    Stripe::SetupIntent.create(
      customer: current_user.stripe_customer.customer_id,
      payment_method_types: ['card'],
      )
  end

  def create
    if params[:redirect_status] == "succeeded"
      setup_intent = Stripe::SetupIntent.retrieve(params[:setup_intent])

      payment_method = Stripe::PaymentMethod.retrieve(setup_intent.payment_method)

      current_user
        .stripe_customer
        .stripe_payments
        .create!(
          payment_id: setup_intent.payment_method,
          **payment_method.card.to_h.slice(:brand, :exp_month, :exp_year, :last4)
          )

      redirect_to item_stripe_payments_path(@item), notice: "カード情報の登録に成功しました"
    else
      redirect_to item_stripe_payments_path(@item), alert: "カード情報の登録に失敗しました"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    stripe_payment = current_user.stripe_customer.stripe_payments.find(params[:id])

    stripe_payment.destroy

    redirect_to item_stripe_payments_path(@item), notice: "カード情報の削除に成功しました"
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
