class UserTransferHistory < ApplicationRecord
  belongs_to :user

  validates :price, presence: true
  validates :bank_name, presence: true
  validates :bank_account_name, presence: true
  validates :kind, presence: true
  validates :bank_account_branch_name, presence: true
  validates :bank_account_number, presence: true

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

  def request_transfer!
    transaction do
      save!
      user.user_earning.price -= price
      user.user_earning.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    false
  end
end
