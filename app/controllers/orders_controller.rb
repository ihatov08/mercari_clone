class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[new create]
  before_action :set_order, only: %i[show ship]
  def new
    @order = Order.new(user: current_user, item: @item)
  end

  def create
    @order = Order.new(user: current_user, item: @item)
    if @order.pay!
      UserMailer.notify_ordered(@order).deliver
      redirect_to order_path(@order), notice: "購入に成功しました"
    else
      flash.now.alert = "購入に失敗しました"
      render :new
    end
  end

  def show
    @message = @order.messages.build
    if current_user.id == @order.user_id && !@order.payer_evaluation
      @order.build_payer_evaluation
    end

    if current_user.id == @order.item.user_id && !@order.seller_evaluation
      @order.build_seller_evaluation
    end
  end

  def ship
    if @order.update(status: :shipped)
      UserMailer.notify_shipped(@order).deliver
      redirect_to order_path(@order), notice: "商品の発送を通知しました"
    else
      flash.now.alert = "商品の発送通知に失敗しました"
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    @order = Order.find(params[:id])

    return if @order.user_id == current_user.id
    return if @order.item.user_id == current_user.id

    raise ActiveRecord::RecordNotFound
  end
end
