class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @item = current_user.items.build
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
