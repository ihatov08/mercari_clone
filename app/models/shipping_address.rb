class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture

  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :line, presence: true
  validates :phone_number, presence: true
end
