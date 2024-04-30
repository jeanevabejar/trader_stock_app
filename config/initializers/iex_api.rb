require 'iex-ruby-client'

IEX::Api.configure do |config|
  config.publishable_token = 'pk_d03ab59bf888444f81c8d25c147f32e6' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_81a76f9a8d414da2ad71d0e6efdfc336' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end
