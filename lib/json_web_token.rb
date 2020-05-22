class JsonWebToken
  # secret to encode and decode token
  HMAC_SECRET = ENV['SECRET_KEY_BASE'].present? ? ENV['SECRET_KEY_BASE'] : Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    # get payload; first index in decoded Array
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end
