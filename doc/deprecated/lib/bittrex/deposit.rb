require 'time'

module Bittrex
  class Deposit
    attr_reader :id, :transaction_id, :address, :quantity, :currency, :confirmations, :executed_at

    def initialize(attrs = {})
      @id = attrs['Id']
      @transaction_id = attrs['TxId']
      @address = attrs['CryptoAddress']
      @quantity = attrs['Amount']
      @currency = attrs['Currency']
      @confirmations = attrs['Confirmations']
      @executed_at = Time.parse(attrs['LastUpdated'])
    end

    def self.all
      Bittrex::Api::Account.getdeposithistory.map{|data| new(data) }
    end
  end
end
