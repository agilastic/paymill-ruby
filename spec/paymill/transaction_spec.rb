require "spec_helper"

describe Paymill::Transaction do
  let(:valid_attributes) do
    {
      amount: 4200,
      status: "pending",
      description: "Test transaction.",
      livemode: false,
      creditcard: {
        card_type: "visa",
        country: "germany"
      },
      client: "client_a013c"
    }
  end

  let (:transaction) do
    Paymill::Transaction.new(valid_attributes)
  end

  describe "#initialize" do
    it "initializes all attributes correctly" do
      transaction.amount.should eql(4200)
      transaction.status.should eql("pending")
      transaction.description.should eql("Test transaction.")
      transaction.livemode.should eql(false)
      transaction.creditcard[:card_type].should eql("visa")
      transaction.creditcard[:country].should eql("germany")
      transaction.client.should eql("client_a013c")
    end
  end

  describe ".find" do
    it "makes a new GET request using the correct API endpoint" do
      Paymill.should_receive(:request).with(:get, Paymill::Transaction::API_ENDPOINT, {}, "/123").and_return("data" => {})
      Paymill::Transaction.find("123")
    end
  end

  describe ".create" do
    it "makes a new POST request using the correct API endpoint" do
      Paymill.should_receive(:request).with(:post, Paymill::Transaction::API_ENDPOINT, valid_attributes).and_return("data" => {})
      Paymill::Transaction.create(valid_attributes)
    end
  end
end