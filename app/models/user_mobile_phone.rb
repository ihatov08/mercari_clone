class UserMobilePhone < ApplicationRecord
  belongs_to :user

  MOBILE_PHONE_REGEXP = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/

  validates :number, presence: true
  validates :number, format: { with: MOBILE_PHONE_REGEXP }, allow_blank: true
  validates :number, uniqueness: true
  validates :auth_code, presence: true

  before_validation :set_auth_code, if: :new_record?

  def send_auth_code_to_sms
    TwilioClient
      .new
      .send_auth_code_to_sms(to: number, auth_code: auth_code)
  end

  def verify(code)
    return unless auth_code == code
    update(verified: true)
  end

  private

  def set_auth_code
    self.auth_code = generate_auth_code
  end

  def generate_auth_code
    sprintf("%.4d", rand(10000))
  end
end
