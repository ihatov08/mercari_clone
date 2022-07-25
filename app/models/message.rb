class Message < ApplicationRecord
  belongs_to :order
  belongs_to :user

  validates :body, presence: true

  def sender
    user
  end

  def recipient
    if user_id == order.user_id
      order.item.user
    else
      order.user
    end
  end
end
