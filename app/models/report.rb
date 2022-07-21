class Report < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :report_reason

  validates :body, presence: true
end
