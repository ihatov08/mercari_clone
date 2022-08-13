class Mypage::CurrentUserBankAccountsController < ApplicationController
  before_action :authenticate_user!

  def update
    current_user_bank_account =
      CurrentUserBankAccount.find_or_initialize_by(
        user_id: current_user.id
      )

    if current_user_bank_account.update(user_bank_account_id: params[:user_bank_account_id])
      redirect_to mypage_user_bank_accounts_path, notice: "振込用銀行口座の更新に成功しました"
    else
      redirect_to mypage_user_bank_accounts_path, alert: "振込用銀行口座の更新に失敗しました"
    end
  end
end
