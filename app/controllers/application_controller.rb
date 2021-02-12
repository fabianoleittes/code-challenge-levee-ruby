# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  private

  def authorize_request
    AuthorizeService.call(request.headers)
  end
end
