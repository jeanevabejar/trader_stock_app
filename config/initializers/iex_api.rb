require 'iex-ruby-client'

IEX::Api.configure do |config|
  config.publishable_token = 'pk_c66a213353324c4aba06a16573872c92' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_07f6a9afe36c4b16b0ef09eff899f93b' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end
