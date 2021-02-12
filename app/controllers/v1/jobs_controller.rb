# frozen_string_literal: true

module V1
  class JobsController < ApplicationController
    before_action :authorize_request

    def create
      save_job
    end

    private

    def build_job
      yield(Job.new(job_params))
    end

    def save_job
      build_job do |job|
        if job.save
          respond_with_json(
            JobBlueprint.render(
              job,
              root: :job
            ), :created
          )
        else
          respond_with_errors(job)
        end
      end
    end

    def job_params
      params
        .require(:job)
        .permit(
          %i[
            title
            partner_id
            category_id
            expires_at
          ]
        )
    end
  end
end
