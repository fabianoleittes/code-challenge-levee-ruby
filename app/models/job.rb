# frozen_string_literal: true

class Job < ApplicationRecord
  validates \
    :title,
    :partner_id,
    :category_id,
    :status,
    :expires_at, presence: true
end
