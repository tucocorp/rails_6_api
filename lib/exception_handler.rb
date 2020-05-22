module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class NotFoundError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Define custom handlers
    rescue_from Mongoid::Errors::Validations, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request

    rescue_from Mongoid::Errors::DocumentNotFound do |e|
      json_response({ message: Message.not_found }, :not_found)
    end

    rescue_from Mongoid::Errors::Validations do |e|
      json_response({ message: Message.invalid_validations }, :unprocessable_entity)
    end

    rescue_from CanCan::AccessDenied do |e|
      json_response({message: Message.unauthorized}, :unauthorized)
    end
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end

  # JSON response with message; Status code 404 - Not Found
  def not_found(e)
    json_response({message: e.message}, :not_found)
  end
end
