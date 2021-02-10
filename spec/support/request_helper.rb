module RequestHelper
  def json_response(symbolize_keys: false)
    json = JSON.parse(response.body)
    symbolize_keys ? json.deep_symbolize_keys : json
  rescue StandardError
    {}
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
