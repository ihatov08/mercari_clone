class Mypage::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      profile_attributes: %i[avatar avatar_cache introduction]
    )
    end
end
