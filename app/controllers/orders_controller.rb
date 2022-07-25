class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def new
    @order = Order.new(user: current_user, item: @item)
  end

  def create
    @order = Order.new(user: current_user, item: @item)
    if @order.pay!
      redirect_to @item, notice: "購入に成功しました"
    else
      flash.now.alert = "購入に失敗しました"
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
