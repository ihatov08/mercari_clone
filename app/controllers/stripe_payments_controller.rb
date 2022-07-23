class StripePaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
