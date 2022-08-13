class UserEarning < ApplicationRecord
  belongs_to :user

  validates :price, presence: true
end
