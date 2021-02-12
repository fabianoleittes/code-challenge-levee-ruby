# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jobs API', type: :request do
  describe 'POST /v1/jobs' do
    context 'when the request is valid' do
      it 'returns http status code created' do
        make_request_for_job(valid_attributes)

        expect(response).to have_http_status(:created)
      end

      it 'create a Job record' do
        expect do
          make_request_for_job(valid_attributes)
        end.to change(Job, :count).by(1)
      end

      it 'returns correct JSON payload' do
        make_request_for_job(valid_attributes)

        attr = json_response['job'].keys
        expect(attr).to contain_exactly(*job_fields)
      end
    end

    context 'when the request is invalid' do
      it 'returns http status code unprocessable_entity' do
        make_request_for_job(invalid_attributes)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a job' do
        expect do
          make_request_for_job(invalid_attributes)
        end.not_to change(Job, :count)
      end

      it 'returns errors within the JSON payload' do
        make_request_for_job(invalid_attributes)

        expect(json_response['errors']).not_to be_empty
      end
    end
  end

  def make_request_for_job(attributes)
    post(
      '/v1/jobs',
      params: attributes.to_json,
      headers: valid_headers
    )
  end

  def valid_attributes
    { job: attributes_for(:job) }
  end

  def invalid_attributes
    { job: attributes_for(:job, title: '') }
  end

  def user
    create(:user)
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def job_fields
    %w[
      id
      title
      partner_id
      category_id
      status
      expires_at
      created_at
      updated_at
    ]
  end
end
