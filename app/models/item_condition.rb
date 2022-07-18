class ItemCondition < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
