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

  describe 'GET /v1/jobs' do
    context 'when there is a list of jobs' do
      it 'returns http status code ok' do
        make_request_for_retrieve_all_job
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of jobs' do
        create_job_list
        make_request_for_retrieve_all_job
        expect(json_response['data'].size).to eq(5)
      end
    end

    context 'when there is no list of jobs' do
      it 'returns http status ok' do
        make_request_for_retrieve_all_job
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty list' do
        make_request_for_retrieve_all_job
        expect(json_response['data'].size).to eq(0)
      end
    end
  end

  describe 'PATCH /v1/jobs/:id' do
    context 'when the request is valid' do
      it 'updates the specified job' do
        job = create_job

        make_request_for_update_status_job(job.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      it 'returns http status code unprocessable_entity' do
        job = create_job

        make_invalid_request_for_update_status_job(job.id)
        expect(response).to have_http_status(:unprocessable_entity)
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

  def make_request_for_retrieve_all_job
    get(
      '/v1/jobs',
      params: {},
      headers: valid_headers
    )
  end

  def make_request_for_update_status_job(id)
    patch(
      "/v1/jobs/#{id}",
      params: update_attr(status: 'active'),
      headers: valid_headers
    )
  end

  def make_invalid_request_for_update_status_job(id)
    patch(
      "/v1/jobs/#{id}",
      params: update_attr,
      headers: valid_headers
    )
  end

  def update_attr(status: '')
    job_params = {
      job: {
        status: status
      }
    }.to_json
  end

  def create_job_list
    create_list(:job, 5)
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

  def create_job
    create(:job)
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
