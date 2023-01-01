module Stripe
  module Api
    module Resources
      module Customers
        class Actions

          def create(params)
            ::Stripe::Api::Request.new.call(url: "/customers", type: :post, data: params)
          end
        end
      end
    end
  end
end
