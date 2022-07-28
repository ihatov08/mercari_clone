class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :trackable

  validates :nickname, presence: true
  validates :gender, presence: true
  before_validation :skip_confirmation!, if: :new_record?
  after_create :create_stripe_customer

  has_one :user_information, dependent: :destroy
  has_one :user_mobile_phone, dependent: :destroy
  has_one :stripe_customer, dependent: :destroy
  has_one :current_shipping_address, dependent: :destroy

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  enum gender: {
      unanswered: 0,
      male: 1,
      female: 2
  }

  class << self
    def genders_i18n
      I18n.t("enums.user.gender")
    end
  end

  def evaluations
    Evaluation
      .joins(order: :item)
      .where(<<~SQL, order_user_id: self.id, item_user_id: self.id)
        (
          evaluations.type = 'SellerEvaluation'
          AND
          orders.user_id = :order_user_id
        )
        OR
        (
          evaluations.type = 'PayerEvaluation'
          AND
          items.user_id = :item_user_id
        )
      SQL
  end

  def remember_me
    true
  end

  def liked?(item)
    favorites.exists?(item: item)
  end
end
