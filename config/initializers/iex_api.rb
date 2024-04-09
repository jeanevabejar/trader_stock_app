require 'iex-ruby-client'

IEX::Api.configure do |config|
  config.publishable_token = 'pk_56ce108f9e08436e97de964351905b86' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_9d33eee5ac8d46dfa154eed6ecfe1388' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end
