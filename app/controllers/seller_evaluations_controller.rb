class SellerEvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def create
  end

  private

  def set_order
    @order = Order.find(params[:order_id])

    return if @order.payer_id == current_user.id
    return if @order.item.user_id == current_user.id

    raise ActiveRecord::RecordNotFound
  end
end
