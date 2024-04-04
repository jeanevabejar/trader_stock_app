class ApplicationController < ActionController::Base
    def clients
        @client =  IEX::Api::Client.new   
    end
end
