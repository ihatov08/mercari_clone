class HomeController < ApplicationController
  def index
    @items = Item.eager_load(:order)
  end
end
