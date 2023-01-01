module Stripe
  module Api
    class Response
      Result = Struct.new(:success?, :error, :data, keyword_init: true)

      def self.call(response)
        if response.success?
          Result.new(success?: true, data: response.parsed_response)
        else
          Result.new(success?: false, error: response.parsed_response["error"])
        end
      end
    end
  end
end
