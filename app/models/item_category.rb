class ItemCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
