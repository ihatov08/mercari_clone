class Mypage::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def destroy
  end
end
