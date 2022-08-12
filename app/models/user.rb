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
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, update_only: true

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :active_relationships,
    class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships,
    class_name: "Relationship",
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_bank_accounts, dependent: :destroy

  enum gender: {
      unanswered: 0,
      male: 1,
      female: 2
  }

  EVALUATION_MAX_RATE = 5
  EVALUATION_MINIMUM_RATE = 1

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

  def evaluation_rate
    evaluation_mappings = evaluations.each_with_object({ good: 0, bad: 0 }) do |evaluation, result|
      result[:good] += 1 if evaluation.good?
      result[:bad] += 1 unless evaluation.good?
    end

    evaluation_count = evaluation_mappings[:good] + evaluation_mappings[:bad]

    good_total_point = evaluation_mappings[:good] * EVALUATION_MAX_RATE
    bad_total_point = evaluation_mappings[:bad] * EVALUATION_MINIMUM_RATE

    ((good_total_point + bad_total_point) / evaluation_count).round
  rescue ZeroDivisionError
    0
  end

  def remember_me
    true
  end

  def liked?(item)
    favorites.exists?(item: item)
  end

  def follow(follow_user)
    active_relationships.create!(followed_id: follow_user.id)
  end

  def unfollow(unfollow_user)
    active_relationships.find_by!(followed_id: unfollow_user.id).destroy!
  end

  def following?(other_user)
    following.where("relationships.followed_id = ?", other_user.id).exists?
  end
end
