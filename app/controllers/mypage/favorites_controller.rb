class Mypage::FavoritesController < ApplicationController
  layout "mypage"
  before_action :authenticate_user!

  def index
  end

  def destroy
  end
end
