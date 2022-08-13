class UserTransferHistory < ApplicationRecord
  belongs_to :user

  validates :price
  validates :bank_name
  validates :bank_account_name
  validates :kind
  validates :bank_account_branch_name
  validates :bank_account_number
end
