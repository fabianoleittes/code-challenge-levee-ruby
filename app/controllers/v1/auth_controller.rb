# frozen_string_literal: true

module V1
  class AuthController < ApplicationController
    def authenticate
      auth_token = AuthenticatorService.call(
        auth_params[:email],
        auth_params[:password]
      )
      respond_with_json(auth_token: auth_token)
    end

    private

    def auth_params
      params.require(:user).permit(:email, :password)
    end
  end
end
