class Mypage::UserBankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_bank_account, only: %i[edit update]

  def index
    @user_bank_accounts = current_user.user_bank_accounts
  end

  def new
    @user_bank_account = current_user.user_bank_accounts.build
  end

  def create
    @user_bank_account = current_user.user_bank_accounts.build(user_bank_account_params)

    if @user_bank_account.save
      redirect_to mypage_user_bank_accounts_path, notice: "銀行口座の登録に成功しました"
    else
      flash.now.alert = "銀行口座の登録に失敗しました"
      render :new
    end
  end

  def edit
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

  def set_user_bank_account
    @user_bank_account = current_user.user_bank_accounts.find(params[:id])
  end
end
