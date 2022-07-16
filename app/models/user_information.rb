class UserInformation < ApplicationRecord
  belongs_to :user

  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birth_date, presence: true
end
