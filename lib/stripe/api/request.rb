module Stripe
  module Api
    class Request
      include HTTParty

      base_uri "https://api.stripe.com/v1"

      format :json

      def call(url:, type:, data: {})
        response = self.class.public_send(type, url, options(data))
        Stripe::Api::Response.call(response)
      end

      private

      def options(data = {})
        {
          basic_auth: { username: "sk_test_4eC39HqLyjWDarjtT1zdp7dc" },
          debug_output: $stdout
        }.merge(body: data.to_json)
      end
    end
  end
end
