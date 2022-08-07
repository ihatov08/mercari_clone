class NewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end
end
