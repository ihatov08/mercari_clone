class Mypage::Items::CompletedController < ApplicationController
  layout "mypage"
  before_action :authenticate_user!

  def index
    @items =
      current_user
        .items
        .joins(:order)
        .merge(Order.completed)
  end
end
