require 'httparty'
require_relative "resources/customers/actions"
require_relative "request"
require_relative "response"
require_relative "constants"

module Stripe
  module Api
    class Client
      VERSION = "0.1.0"

      attr_reader :api_key, :test_mode, :resources

      def initialize(options: {}, resources: Stripe::Api::Constants::RESOURCES)
        @api_key = options[:api_key]
        @resources = resources
      end

      def method_missing(method_name, *args)
        if resources.has_key?(method_name)
          resources[method_name].new
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        resources.has_key?(method_name) || super
      end
    end
  end
end
