module Stripe
  module Api
    class Request
      include HTTParty

      base_uri "https://api.stripe.com/v1"

      format :json

      attr_reader :api_key, :debug_output

      def initialize(api_key:, debug_output: $stdout)
        @api_key = api_key
        @debug_output = debug_output
      end

      def call(url:, type:, data: {})
        response = self.class.public_send(type, url, options(data))
        Stripe::Api::Response.call(response)
      end

      private

      def options(data = {})
        {
          basic_auth: { username: api_key },
          debug_output: debug_output
        }.merge(body: data)
      end
    end
  end
end
