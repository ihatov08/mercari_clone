class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def create
    @message = @order.messages.build(message_params)
    @message.user_id = current_user.id

    if @message.save
      UserMailer.notify_message(@message).deliver
      redirect_to order_path(@order), notice: "メッセージの作成に成功しました"
    else
      @item = @order.item
      flash.now.alert = "メッセージの作成に失敗しました"
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

  def message_params
    params.require(:message).permit(:body)
  end
end
