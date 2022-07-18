class UserMobilePhone < ApplicationRecord
  belongs_to :user

  validates :number, presence: true
  validates :number, uniqueness: true
  validates :auth_code, presence: true
end
