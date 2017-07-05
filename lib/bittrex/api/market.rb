# frozen_string_literal: true

# https://bittrex.com/Home/Api
module Bittrex
  module Api
    module Market
      include Clientable

      MARKET_APIS = [
        [:buylimit, %i(market quantity rate)],
        [:selllimit, %i(market quantity rate)],
        [:cancel, %i(uuid)],
        [:getopenorders, %i(market)],
      ]


      MARKET_APIS.each do |key, params|
        params    ||= []
        arguments = params.map {|i| "#{i} = nil"}.join(',')

        class_eval <<-CODE, __FILE__, __LINE__ + 1
        def #{key}(#{arguments})
            client.get("market/#{key}"#{',' unless params.empty?}#{params.map {|i| "#{i}: #{i}"}.join(", ")})
        end
        module_function :#{key}
        CODE
      end

    end
  end
end
