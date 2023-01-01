module Stripe
  module Api
    module Constants
      RESOURCES = {
        customers: Stripe::Api::Resources::Customers::Actions
      }.freeze
    end
  end
end

