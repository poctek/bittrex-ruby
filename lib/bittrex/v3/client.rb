# frozen_string_literal: true

module Bittrex
  module V3
    class Client < ::Bittrex::Client
      attr_reader :key, :secret

      def prefix
        '/api/v3'
      end
    end
  end
end
