# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  class AuthenticatorError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  class ForbiddenAccess < StandardError; end

  class NotPermittedException < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticatorError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ExceptionHandler::NotPermittedException,
                with: lambda {
                        json_response({ error: 'Not Permitted' }, :forbidden)
                      }
  end

  private

  def four_twenty_two(err)
    json_response({ message: err.message }, :unprocessable_entity)
  end

  def unauthorized_request(err)
    json_response({ message: err.message }, :unauthorized)
  end
end
