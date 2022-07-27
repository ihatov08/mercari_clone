class SellerEvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def create
    @order.build_seller_evaluation(seller_evaluation_params)
    @order.status = :completed

    if @order.save
      UserMailer.notify_evaluation(@order).deliver
      redirect_to order_path(@order), notice: "評価の作成に成功しました"
    else
      @order.restore_status!
      flash.now.alert = "評価の作成に失敗しました"
      render "orders/show"
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])

    return if @order.user_id == current_user.id
    return if @order.item.user_id == current_user.id

    raise ActiveRecord::RecordNotFound
  end

  def seller_evaluation_params
    params.require(:seller_evaluation).permit(
      :good,
      :comment
      )
  end
end
