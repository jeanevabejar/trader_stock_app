require 'iex-ruby-client'

IEX::Api.configure do |config|
  config.publishable_token = 'pk_1db9fc9a77fb480283222c66d191a532' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_d1eebe0b4a1e46d88ae114947dccb8c6' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end
