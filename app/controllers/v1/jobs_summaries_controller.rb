# frozen_string_literal: true

module V1
  class JobsSummariesController < ApplicationController
    def show
      respond_with_json(
        JobSummaryService.by_category(params[:id])
      )
    end
  end
end
