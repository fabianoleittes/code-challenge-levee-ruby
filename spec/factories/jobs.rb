# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    title { 'Software Engineer' }
    partner_id { rand(10_000) }
    category_id { 1 }
    expires_at { '2021-02-12 16:10:18' }
    status { 'draft' }
  end
end
