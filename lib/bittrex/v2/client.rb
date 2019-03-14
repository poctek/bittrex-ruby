# frozen_string_literal: true

module Bittrex
  module V2
    class Client < ::Bittrex::Client
      def prefix
        '/api/v2.0'
      end
    end
  end
end