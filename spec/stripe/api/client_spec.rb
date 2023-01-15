RSpec.describe Stripe::Api::Client do
  let(:subject) { described_class.new(api_key: "sk_test_4eC39HqLyjWDarjtT1zdp7dc") }

  it "has a version number" do
    expect(Stripe::Api::Client::VERSION).not_to be nil
  end

  describe '.customers.create' do
    it "creates a customer" do
      result = subject.customers.create(description: 'test')

      expect(result.success?).to eq true
      expect(result.data['id']).to match(/cus_*+/)
    end
  end

  describe '.client.tokens.create_credit_card' do
    context 'with valid data' do
      it 'creates a credit card' do
        result = subject.tokens.create_credit_card({
          number: "4242424242424242",
          cvc: "123",
          exp_month: 12,
          exp_year:2030
        })

        expect(result.success?).to eq true
        expect(result.data['id']).to match(/tok_*+/)
      end

    end

    context 'with invalid data' do
      it 'returns proper error message' do
        result = subject.tokens.create_credit_card({ number: "4444", cvc: "123", exp_month: 12, exp_year:2030 })

        expect(result.success?).to eq false
        expect(result.error['code']).to eq 'invalid_number'
        expect(result.error['message']).to eq 'The card number is not a valid credit card number.'
        expect(result.error['param']).to eq 'number'
      end
    end
  end
end
