class Mypage::UserBankAccountsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_bank_account = current_user.user_bank_accounts.build
  end

  def create
  end

  private

  def user_bank_account_params
    params.require(:user_bank_account).permit(
      :name,
      :kind,
      :branch_name,
      :account_number,
      :account_name
    )
  end
end
