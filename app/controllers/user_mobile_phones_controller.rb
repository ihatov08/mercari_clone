class UserMobilePhonesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_mobile_phone = current_user.build_user_mobile_phone
  end

  def create
    @user_mobile_phone = current_user.build_user_mobile_phone(user_mobile_phone_params)

    if @user_mobile_phone.save
      @user_mobile_phone.send_auth_code_to_sms
      redirect_to verification_user_mobile_phone_path, notice: "電話番号登録に成功しました"
    else
      flash.now.alert = "電話番号登録に失敗しました"
      render :new
    end
  end

  def verification
    @user_mobile_phone = current_user.user_mobile_phone
    return unless request.post?

    if @user_mobile_phone.verify(params[:auth_code])
      redirect_to :root, notice: "電話番号認証に成功しました"
    else
      flash.now.alert = "電話番号認証に失敗しました"
      render :verification
    end
  end

  private

  def user_mobile_phone_params
    params.require(:user_mobile_phone).permit(:number)
  end
end
