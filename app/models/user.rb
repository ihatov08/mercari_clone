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

  enum gender: {
      unanswered: 0,
      male: 1,
      female: 2
  }
end
