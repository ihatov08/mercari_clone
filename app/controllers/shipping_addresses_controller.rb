class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[index new create edit update]

  def index
    @shipping_addresses = current_user.shipping_addresses
  end

  def new
    @shipping_address = current_user.shipping_addresses.build
  end

  def create
    @shipping_address = current_user.shipping_addresses.build(shipping_address_params)

    if @shipping_address.save
      redirect_to item_shipping_addresses_path(@item), notice: "配送先住所の登録に成功しました"
    else
      flash.now.alert = "配送先住所の登録に失敗しました"
      render :new
    end
  end

  def edit
    @shipping_address = current_user.shipping_addresses.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shipping_address_params
    params.require(:shipping_address).permit(
      :family_name,
      :given_name,
      :family_name_kana,
      :given_name_kana,
      :postal_code,
      :prefecture_id,
      :city,
      :line,
      :building_name,
      :phone_number
    )
  end
end
