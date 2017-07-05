# frozen_string_literal: true

# https://bittrex.com/Home/Api
module Bittrex
  module Api
    module Public
      include Clientable

      PUBLIC_APIS = [
        [:getmarkets],
        [:getcurrencies],
        [:getticker, %i(market)],
        [:getmarketsummaries],
        [:getmarketsummary, %i(market)],
        [:getorderbook, %i(market type depth)],
        [:getmarkethistory, %i(market)],
      ]


      PUBLIC_APIS.each do |key, params|
        params    ||= []
        arguments = params.map {|i| "#{i} = nil"}.join(',')

        class_eval <<-CODE, __FILE__, __LINE__ + 1
        def #{key}(#{arguments})
            client.get("public/#{key}"#{',' unless params.empty?}#{params.map {|i| "#{i}: #{i}"}.join(", ")})
        end
        module_function :#{key}
        CODE
      end

    end
  end
end
