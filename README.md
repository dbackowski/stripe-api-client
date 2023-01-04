# Stripe::Api::Client

Very simple Stripe API wrapper in Ruby (POC)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stripe-api-client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stripe-api-client

## Usage

* initalize client with your api-key

```ruby
client = Stripe::Api::Client.new(api_key: "sk_test_4eC39HqLyjWDarjtT1zdp7dc")
```

* successful creating customer

```ruby
result = client.customers.create(description: "test")
result.success?
=> true
result.data
=> {"id"=>"cus_N6orcVjNow4w3f", "object"=>"customer", "address"=>nil, "balance"=>0, "created"=>1672855062, "currency"=>nil, "default_source"=>nil, "delinquent"=>false, "description"=>"test", "discount"=>nil, "email"=>nil, "invoice_prefix"=>"B7097CDF", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>nil, "footer"=>nil, "rendering_options"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>1, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "tax_exempt"=>"none", "test_clock"=>nil}
```

* successful creating credit card

```ruby
result = client.tokens.create_credit_card({ number: "4242424242424242", cvc: "123", exp_month: 12, exp_year:2030 })
result.success?
=> true
result.data
=> {"id"=>"tok_1MMbEG2eZvKYlo2CjXPyKqpD", "object"=>"token", "card"=>{"id"=>"card_1MMbEG2eZvKYlo2C071DkTWW", "object"=>"card", "address_city"=>nil, "address_country"=>nil, "address_line1"=>nil, "address_line1_check"=>nil, "address_line2"=>nil, "address_state"=>nil, "address_zip"=>nil, "address_zip_check"=>nil, "brand"=>"Visa", "country"=>"US", "cvc_check"=>"unchecked", "dynamic_last4"=>nil, "exp_month"=>12, "exp_year"=>2030, "fingerprint"=>"Xt5EWLLDS7FJjR1c", "funding"=>"credit", "last4"=>"4242", "metadata"=>{}, "name"=>nil, "tokenization_method"=>nil}, "client_ip"=>"83.29.164.197", "created"=>1672855100, "livemode"=>false, "type"=>"card", "used"=>false}
```

* failed attempt of creating a credit card

```ruby
result = client.tokens.create_credit_card({ number: "4444", cvc: "123", exp_month: 12, exp_year:2030 })
result.success?
=> false
result.error
 => {"code"=>"invalid_number", "doc_url"=>"https://stripe.com/docs/error-codes/invalid-number", "message"=>"The card number is not a valid credit card number.", "param"=>"number", "request_log_url"=>"https://dashboard.stripe.com/test/logs/req_U0T1ksXxAypZoh?t=1672855127", "type"=>"card_error"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stripe-api-client.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
