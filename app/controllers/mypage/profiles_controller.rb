class Mypage::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: "プロフィールの更新に成功しました"
    else
      flash.now.alert = "プロフィールの更新に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      profile_attributes: %i[avatar avatar_cache introduction]
    )
    end
end
