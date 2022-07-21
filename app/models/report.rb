class Report < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :report_reason
end
