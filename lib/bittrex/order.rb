require 'time'

module Bittrex
  class Order
    attr_reader :type, :id, :limit,
                :exchange, :price, :quantity, :remaining,
                :total, :fill, :executed_at, :raw

    def initialize(attrs = {})
      @id             = attrs['Id'] || attrs['OrderUuid']
      @type           = (attrs['Type'] || attrs['OrderType'])
      @exchange       = attrs['Exchange']
      @quantity       = attrs['Quantity']
      @remaining      = attrs['QuantityRemaining']
      @price          = attrs['Rate'] || attrs['Price']
      @price_per_unit = attrs['PricePerUnit']
      @total          = attrs['Total']
      @fill           = attrs['FillType']
      @limit          = attrs['Limit']
      @commission     = attrs['Commission'] || attrs['CommissionPaid']
      @executed_at    = attrs['TimeStamp'] ? Time.parse(attrs['TimeStamp']) : nil
      @opend          = attrs['Opened'] ? Time.parse(attrs['Opened']) : nil
      @closed         = attrs['Closed'] ? Time.parse(attrs['Closed']) : nil
      @is_open        = attrs['IsOpen']

      @raw = attrs
    end

    class << self
      def book(market, type, depth = 50)
        orders = []

        if type.to_sym == :both
          orderbook(market, type.downcase, depth).each_pair do |type, values|
            values.each do |data|
              orders << new(data.merge('Type' => type))
            end
          end
        else
          orderbook(market, type.downcase, depth).each do |data|
            orders << new(data.merge('Type' => type))
          end
        end

        orders
      end

      def open
        Bittrex::Api::Market.getopenorders(nil).map {|data| new(data)}
      end

      def history(market: nil)
        Bittrex::Api::Account.getorderhistory(market).map {|data| new(data)}
      end

      def get(uuid)
        new Bittrex::Api::Account.getorder(uuid)
      end

      private

      def orderbook(market, type, depth)
        Bittrex::Api::Public.getorderbook(market, type, depth)
      end
    end
  end
end
