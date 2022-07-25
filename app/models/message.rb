class Message < ApplicationRecord
  belongs_to :order
  belongs_to :user

  validates :body, presence: true
end
