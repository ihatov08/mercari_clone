class UserTransferHistory < ApplicationRecord
  belongs_to :user

  validates :price
  validates :bank_name
  validates :bank_account_name
  validates :kind
  validates :bank_account_branch_name
  validates :bank_account_number

  enum bank_account_kind: {
    saving: 1,
    checking: 2
  }

  class << self
    def bank_account_kinds_i18n
      I18n.t("enums.user_transfer_history.kind")
    end
  end

  def bank_account_kind_i18n
    self.class.bank_account_kinds_i18n[bank_account_kind.to_sym]
  end
end
