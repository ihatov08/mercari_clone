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

  class << self
    def kinds_i18n
      I18n.t("enums.user_bank_account.kind")
    end
  end
end
