class ApplicationController < ActionController::Base
    def clients
        @client =  IEX::Api::Client.new   
    end

    def search
        @client = clients
        @client.ref_data_symbols()
    end
end
