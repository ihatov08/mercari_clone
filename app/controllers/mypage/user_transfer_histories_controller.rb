class Mypage::UserTransferHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_transfer_history

  def new
  end

  def create
    @user_transfer_history.price = params[:user_transfer_history][:price]

    if @user_transfer_history.save
      redirect_to mypage_path, notice: "振込申請に成功しました"
    else
      flash.now.alert = "振込申請に失敗しました"
      render :new
    end
  end

  private

  def set_user_transfer_history
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
end
