class Mypage::Items::InProgressController < ApplicationController
  layout 'mypage'
  before_action :authenticate_user!

  def index
    @items =
      current_user
        .items
        .joins(:order)
        .merge(Order.not_completed)
  end
end
