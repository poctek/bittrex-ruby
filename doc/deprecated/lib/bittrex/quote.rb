module Bittrex
  class Quote
    attr_reader :market, :bid, :ask, :last, :raw

    def initialize(market, attrs = {})
      @market = market
      @bid = attrs['Bid']
      @ask = attrs['Ask']
      @last = attrs['Last']
      @raw = attrs
    end

    # Example:
    # Bittrex::Quote.current('BTC-HPY')
    def self.current(market)
      new(market, Bittrex::Api::Public.getticker(market))
    end
  end
end
