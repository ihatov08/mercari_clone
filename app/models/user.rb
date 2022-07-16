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
end
