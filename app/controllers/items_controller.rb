class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_user_item, only: [:edit, :update]
  before_action :check_order, only: %i[edit update]

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to @item, notice: "商品の作成に成功しました"
    else
      flash.now.alert = "商品の作成に失敗しました"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "商品の更新に成功しました"
    else
      flash.now.alert = "商品の更新に失敗しました"
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :item_category_id,
      :item_condition_id,
      :name,
      :description,
      :shipping_payer_type_id,
      :prefecture_id,
      :shipping_day_type_id,
      :price,
      :images_cache,
      images: []
    )
  end

  def set_current_user_item
    @item = current_user.items.find(params[:id])
  end

  def check_order
    if @item.order
      redirect_to item_path(@item), alert: "商品は購入済のため編集できません"
    end
  end
end
