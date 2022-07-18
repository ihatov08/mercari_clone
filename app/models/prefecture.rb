class Prefecture < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name_en, presence: true, uniqueness: true
end
