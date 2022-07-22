class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :reports, dependent: :destroy

  validates :body, presence: true
end
