module Paymill
  class Transaction
    API_ENDPOINT = "transactions"

    include Paymill::Operations::Create
    include Paymill::Operations::Find

    attr_accessor :id, :amount, :status, :description, :livemode,
                  :creditcard, :client, :created_at, :updated_at

    def initialize(attributes = {})
      attributes.each_pair do |key, value|
        instance_variable_set("@#{key}", value)
      end
      @attributes  = attributes
    end
  end
end