# frozen_string_literal: true

class JobSummaryService
  attr_reader :category_id

  def initialize(category_id:)
    @category_id = category_id
  end

  def self.by_category(category_id)
    new(category_id: category_id).call
  end

  def call
    filtered_jobs_by_status_and_category.map do |job|
      { total: job.total, percentage: job.percentage }
    end
  end

  def filtered_jobs_by_status_and_category
    if category
      return Job.select('COUNT(*) AS total, SUM(category_id) AS percentage')
                .where(status: 'active', category_id: category_id)
    end

    raise(ExceptionHandler::CategoryNotFound, Message.not_found)
  end

  def category
    Job.find_by(category_id: category_id)
  end
end
