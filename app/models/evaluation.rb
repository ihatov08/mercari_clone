class Evaluation < ApplicationRecord
  belongs_to :order

  validates :comment, presence: true
end
