# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorizeService do
  let(:user) { create(:user) }

  describe '#call' do
    context 'when valid request' do
      it 'returns user object' do
        auth   = make_authorize(valid_headers)
        result = auth.call

        expect(result[:user]).to eq(user)
      end
    end

    context 'when missing token' do
      it 'raises a MissingToken error' do
        auth = make_authorize(invalid_headers)

        expect { auth.call }
          .to raise_error(ExceptionHandler::MissingToken, 'Missing token')
      end
    end

    context 'when invalid token' do
      it 'raises an InvalidToken error' do
        auth = make_authorize(invalid_token)

        expect { auth.call }
          .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
      end
    end

    context 'when token is expired' do
      it 'raises ExceptionHandler::ExpiredSignature error' do
        auth = make_authorize(expired_token)

        expect { auth.call }
          .to raise_error(
            ExceptionHandler::InvalidToken,
            /Signature has expired/
          )
      end

      context 'when fake token' do
        it 'handles JWT::DecodeError' do
          auth = make_authorize(fake_token)

          expect { auth.call }
            .to raise_error(
              ExceptionHandler::InvalidToken,
              /Not enough or too many segments/
            )
        end
      end
    end
  end

  def make_authorize(headers)
    described_class.new(headers)
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def expired_token
    { 'Authorization' => expired_token_generator(user.id) }
  end
end
