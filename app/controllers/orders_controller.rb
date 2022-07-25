class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def new
    @order = Order.new(user: current_user, item: @item)
  end

  def create
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
