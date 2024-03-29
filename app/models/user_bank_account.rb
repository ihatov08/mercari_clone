class UserBankAccount < ApplicationRecord
  belongs_to :user
  has_one :current_user_bank_account, dependent: :destroy

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

  def kind_i18n
    self.class.kinds_i18n[kind.to_sym]
  end
end
