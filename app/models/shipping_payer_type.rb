class ShippingPayerType < ApplicationRecord
  validates :name, presence: true, uniquness: true
end
