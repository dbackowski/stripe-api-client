module Stripe
  module Api
    module Resources
      class Base
        def initialize(api_key:)
          @request = ::Stripe::Api::Request.new(api_key: api_key)
        end

        def request(url:, type:, data: {})
          @request.call(url: url, type: type, data: data)
        end
      end
    end
  end
end
