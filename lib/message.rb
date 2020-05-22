class Message
  def self.not_found
    I18n.t('errors.messages.not_found')
  end

  def self.invalid_validations
    I18n.t('errors.messages.invalid_validations')
  end

  def self.invalid_credentials
    I18n.t('errors.messages.invalid_credentials')
  end

  def self.invalid_token
    I18n.t('errors.messages.invalid_token')
  end

  def self.missing_token
    I18n.t('errors.messages.missing_token')
  end

  def self.unauthorized
    I18n.t('errors.messages.unauthorized')
  end

  def self.account_created
    I18n.t('errors.messages.account_created')
  end

  def self.account_not_created
    I18n.t('errors.messages.account_not_created')
  end

  def self.expired_token
    I18n.t('errors.messages.expired_token')
  end

  def self.not_blank
    I18n.t('errors.messages.not_blank')
  end

  def self.unauthorized
    I18n.t('errors.messages.unauthorized')
  end
end
