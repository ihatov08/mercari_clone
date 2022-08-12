class UserBankAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :kind, presence: true
  validates :branch_name, presence: true
  validates :account_number, presence: true
  validates :account_name, presence: true

  enum kind: {
    saving: 1,
    checking: 2
  }
end
