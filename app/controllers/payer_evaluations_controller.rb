class PayerEvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def create
    @order.build_payer_evaluation(payer_evaluation_params)
    @order.status = :received

    if @order.save
      UserMailer.notify_received(@order).deliver
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

  def payer_evaluation_params
    params.require(:payer_evaluation).permit(
      :received,
      :good,
      :comment
      )
  end
end
