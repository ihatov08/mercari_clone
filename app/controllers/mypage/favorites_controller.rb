class Mypage::FavoritesController < ApplicationController
  layout "mypage"
  before_action :authenticate_user!

  def index
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])

    favorite.destroy

    redirect_to mypage_favorites_path, notice: "いいねを削除しました"
  end
end
