require 'bittrex/client'

module Bittrex
  module V2
    class Client < ::Bittrex::Client
      attr_reader :key, :secret

      def prefix
        '/api/v2.0'
      end
    end
  end
end