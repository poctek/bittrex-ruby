require 'time'

module Bittrex
  class Market
    attr_reader :name, :currency, :base, :currency_name, :base_name, :minimum_trade, :active, :created_at, :raw

    def initialize(attrs = {})
      @name = attrs['MarketName']
      @currency = attrs['MarketCurrency']
      @base = attrs['BaseCurrency']
      @currency_name = attrs['MarketCurrencyLong']
      @base_name = attrs['BaseCurrencyLong']
      @minimum_trade = attrs['MinTradeSize']
      @active = attrs['IsActive']
      @created_at = Time.parse(attrs['Created'])
      @raw = attrs
    end

    def self.all
      Bittrex::Api::Public.getmarkets.map{|data| new(data) }
    end
  end
end
