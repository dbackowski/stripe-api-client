module Stripe
  module Api
    class Response
      Result = Struct.new(:success?, :errors, :data, keyword_init: true)

      def self.call(response)
        if response.success?
          Result.new(success?: true, data: response)
        else
          Result.new(success?: false, errors: response.body)
        end
      end
    end
  end
end
