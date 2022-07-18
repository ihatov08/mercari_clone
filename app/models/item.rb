class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_payer_type
  belongs_to :prefecture
  belongs_to :shipping_day_type
end
