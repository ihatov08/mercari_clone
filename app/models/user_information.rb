class UserInformation < ApplicationRecord
  belongs_to :user

  ZENKAKU_REGEXP = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/

  validates :family_name, presence: true, format: { with: ZENKAKU_REGEXP, message: "は全角で入力してください" }, allow_blank: true
  validates :given_name, presence: true, format: { with: ZENKAKU_REGEXP, message: "は全角で入力してください" }, allow_blank: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birth_date, presence: true
end
