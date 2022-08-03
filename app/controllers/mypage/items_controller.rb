class Mypage::ItemsController < ApplicationController
  layout "mypage"
  before_action :authenticate_user!

  def index
    @items =
      current_user
        .items
        .left_joins(:order)
        .where(order: { id: nil })
  end
end
