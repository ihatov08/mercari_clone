class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  enum status: {
    ordered: 10,
    shipped: 20,
    received: 30,
    completed: 40
  }

  validates :status, presence: true
  validates :payment_method_id, presence: true
  validates :payer_family_name, presence: true
  validates :payer_given_name, presence: true
  validates :payer_family_name_kana, presence: true
  validates :payer_given_name_kana, presence: true
  validates :payer_postal_code, presence: true
  validates :payer_prefecture_id, presence: true
  validates :payer_city, presence: true
  validates :payer_line, presence: true
  validates :payer_building_name, presence: true
  validates :payer_phone_number, presence: true
end
