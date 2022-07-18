class TwilioClient
  def client
    @client ||=
      Twilio::REST::Client
        .new(
          ENV["TWILIO_ACCOUNT_SID"],
          ENV["TWILIO_AUTH_TOKEN"]
        )
  end

  def send_auth_code_to_sms(to:, auth_code:)
    client
      .messages
      .create(
        from: ENV["TWILIO_PHONE_NUMBER"],
        to: "+81#{to}",
        body: make_body(auth_code)
      )
  end

  def make_body(auth_code)
    <<~BODY
      こちらはURIKAIです。
      認証コードは #{auth_code} です。
    BODY
  end
end
