class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[new]

  def index
  end

  def new
    @shipping_address = current_user.shipping_addresses.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
