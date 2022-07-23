class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[index new create edit update destroy]
  before_action :set_shipping_address, only: %i[edit update destroy]

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
  end

  def update
    if @shipping_address.update(shipping_address_params)
      redirect_to item_shipping_addresses_path(@item), notice: "配送先住所の更新に成功しました"
    else
      flash.now.alert = "配送先住所の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @shipping_address.destroy

    redirect_to item_shipping_addresses_path(@item), notice: "配送先住所の削除に成功しました"
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_shipping_address
    @shipping_address = current_user.shipping_addresses.find(params[:id])
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
