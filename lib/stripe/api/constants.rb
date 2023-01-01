module Stripe
  module Api
    module Constants
      RESOURCES = {
        customers: Stripe::Api::Resources::Customers::Actions,
        tokens: Stripe::Api::Resources::Tokens::Actions
      }.freeze
    end
  end
end

