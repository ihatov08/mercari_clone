class CurrentStripePaymentsController < ApplicationController
  before_action authenticate_user!

  def update
    @item = Item.find(params[:item_id])
    current_stripe_payemnt = CurrentStripePayment.find_or_initialize_by(
      stripe_customer_id: current_user.stripe_customer.id
    )

    if current_stripe_payemnt.update(stripe_payment_id: params[:stripe_payment_id])
      redirect_to new_item_order_path(@item), notice: "カード情報を更新しました"
    else
      flash.now.alert = "カード情報の更新に失敗しました"
      render "items/show"
    end
  end
end
