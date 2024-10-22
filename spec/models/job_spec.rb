# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:partner_id) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:expires_at) }
end
