require 'iex-ruby-client'

IEX::Api.configure do |config|
  config.publishable_token = 'pk_65e4c853f1a54a48b1c2ea90a4550de9' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_1c6ac79f63034f97bb749735d0abfa8a' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end
