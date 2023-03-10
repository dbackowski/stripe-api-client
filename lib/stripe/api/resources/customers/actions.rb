module Stripe
  module Api
    module Resources
      module Customers
        class Actions < Stripe::Api::Resources::Base
          def create(data = {})
            request(
              url: "/customers",
              type: :post,
              data: data
            )
          end
        end
      end
    end
  end
end
