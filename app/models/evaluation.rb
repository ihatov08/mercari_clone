class Evaluation < ApplicationRecord
  belongs_to :order

  validates :comment, presence: true

  scope :with_good, ->(bool) {
    if bool.nil?
      where(good: true)
    else
      where(good: bool)
    end
  }
end
