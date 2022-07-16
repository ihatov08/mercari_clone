class UserInformationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_information = current_user.build_user_information
  end

  def create
  end

  private

  def user_information_params
    params.require(:user_information).permit(
      :family_name,
      :given_name,
      :family_name_kana,
      :given_name_kana,
      :birth_date
    )
  end
end
