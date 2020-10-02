require 'time'

module Bittrex
  class Summary
    attr_reader :name, :high, :low, :volume, :last, :base_volume, :raw, :created_at

    alias_method :vol, :volume
    alias_method :base_vol, :base_volume

    def initialize(attrs = {})
      @name        = attrs['MarketName']
      @high        = attrs['High']
      @low         = attrs['Low']
      @volume      = attrs['Volume']
      @last        = attrs['Last']
      @base_volume = attrs['BaseVolume']
      @raw         = attrs
      @created_at  = Time.parse(attrs['TimeStamp'])
    end

    def self.all
      Bittrex::Api::Public.getmarketsummaries.map{|data| new(data) }
    end
  end
end
