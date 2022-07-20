class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.build(item: @item)

    if favorite.save
      redirect_to @item, notice: "いいねしました"
    else
      flash.now.alert = "いいねに失敗しました"
      render "items/show"
    end
  end

  def destroy
    favorite = current_user.favorites.find_by!(item_id: params[:item_id])

    if favorite.destroy
      redirect_to favorite.item, notice: "いいねを取り消しました"
    else
      @item = favorite.item
      flash.now.alert = "いいねの取り消しに失敗しました"
      render "items/show"
    end
  end
end
