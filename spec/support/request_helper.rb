# frozen_string_literal: true

module RequestHelper
  def json_response(symbolize_keys: false)
    json = JSON.parse(response.body)
    symbolize_keys ? json.deep_symbolize_keys : json
  rescue StandardError
    {}
  end

  def token_generator(user_id, adapter = JsonWebTokenAdapter)
    adapter.encode(user_id: user_id)
  end

  def expired_token_generator(user_id, adapter = JsonWebTokenAdapter)
    adapter.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end

  def invalid_token
    {
      'Authorization' => token_generator(42),
      'Content-Type' => 'application/json'
    }
  end

  def fake_token
    { 'Authorization' => 'levee' }
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
