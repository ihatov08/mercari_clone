class Mypage::UserTransferHistoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    user_bank_account = current_user.current_user_bank_account.user_bank_account
    @user_transfer_history =
      current_user.user_transfer_histories.build(
        bank_name: user_bank_account.name,
        bank_account_kind: user_bank_account.kind,
        bank_account_branch_name: user_bank_account.branch_name,
        bank_account_name: user_bank_account.account_name,
        bank_account_number: user_bank_account.account_number
      )
  end

  def create
  end
end
