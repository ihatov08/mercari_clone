class UserInformationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_information = current_user.build_user_information
  end

  def create
  end
end
