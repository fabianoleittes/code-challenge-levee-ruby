require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /v1/signup' do
    context 'when the request is valid' do
      it 'returns http status code created' do
        make_request_for_signup(valid_attributes)

        expect(response).to have_http_status(:created)
      end
    end

    it 'create a User account' do
      expect do
        make_request_for_signup(valid_attributes)
      end.to change(User, :count).by(1)
    end

    it 'returns correct JSON payload' do
      make_request_for_signup(valid_attributes)

      attr = json_response['user'].keys
      expect(attr).to contain_exactly(*user_fields)
    end

    context 'when the request is invalid' do
      it 'returns http status code unprocessable_entity' do
        make_request_for_signup(invalid_attributes)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a User' do
        expect do
          make_request_for_signup(invalid_attributes)
        end.not_to change(User, :count)
      end

      it 'returns errors within the JSON payload' do
        make_request_for_signup(invalid_attributes)

        expect(json_response['errors']).not_to be_empty
      end
    end
  end

  def make_request_for_signup(attributes)
    post(
      '/v1/signup',
      params: attributes.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def valid_attributes
    {
      "user": {
        "name": "Son Goku",
        "email":"goku@gmail.com",
        "password": "12345678",
        "password_confirmation": "12345678"
      }
    }
  end

  def invalid_attributes
    {
      "user": {
        "name": "",
        "email":"goku@gmail.com",
        "password": "12345678",
        "password_confirmation": "12345678"
      }
    }
  end

  def user_fields
    %w[
      id
      name
      email
      password_digest
      created_at
      updated_at
    ]
  end
end
