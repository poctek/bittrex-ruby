module Bittrex
  class Wallet
    attr_reader :id, :currency, :balance, :available, :pending, :address, :requested, :raw

    def initialize(attrs = {})
      @id = attrs['Uuid'].to_s
      @address = attrs['CryptoAddress']
      @currency = attrs['Currency']
      @balance = attrs['Balance']
      @available = attrs['Available']
      @pending = attrs['Pending']
      @raw = attrs
      @requested = attrs['Requested']
    end


    class << self
      def all
        Bittrex::Api::Account.getbalances.map{|data| new(data)}
      end

      def get(currency:)
        new Bittrex::Api::Account.getbalance(currency)
      end
    end
  end
end
