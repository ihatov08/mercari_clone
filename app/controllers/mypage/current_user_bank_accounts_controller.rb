class Mypage::CurrentUserBankAccountsController < ApplicationController
  before_action :authenticate_user!

  def update
  end
end
