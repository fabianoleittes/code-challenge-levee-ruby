# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticatorService do
  describe '.call' do
    context 'when valid credentials' do
      it 'returns an auth token' do
        expect(
          build_auth(user.email, user.password)
        ).not_to be_nil
      end
    end

    context 'when invalid credentials' do
      it 'raise an authenticator error' do
        expect { build_auth(user.email, 'invalid') }
          .to raise_error(
            ExceptionHandler::AuthenticatorError, /Invalid credentials/
          )
      end
    end

    def user
      create(:user)
    end

    def build_auth(email, password)
      AuthenticatorService.call(email, password)
    end
  end
end
