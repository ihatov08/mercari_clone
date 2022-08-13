class CurrentUserBankAccount < ApplicationRecord
  belongs_to :user
  belongs_to :user_bank_account
end
