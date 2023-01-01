module Stripe
  module Api
    module Resources
      module Tokens
        class Actions < Stripe::Api::Resources::Base
          def create_credit_card(data = {})
            request(
              url: "/tokens",
              type: :post,
              data: data
            )
          end
        end
      end
    end
  end
end
