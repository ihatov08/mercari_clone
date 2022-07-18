class UserMobilePhonesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_mobile_phone = current_user.build_user_mobile_phone
  end

  def create
  end

  def verification
  end
end
