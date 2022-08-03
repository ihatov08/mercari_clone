class Mypage::ItemsController < ApplicationController
  layout "mypage"
  before_action :authenticate_user!

  def index
  end
end
