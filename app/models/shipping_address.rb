class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture

  ZENKAKU_REGEXP = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/

  validates :family_name, presence: true
  validates :family_name, format: { with: ZENKAKU_REGEXP, "は全角で入力してください" }, allow_blank: true
  validates :given_name, presence: true
  validates :given_name, format: { with: ZENKAKU_REGEXP, "は全角で入力してください" }, allow_blank: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :line, presence: true
  validates :phone_number, presence: true
end
